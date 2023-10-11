const JadwalUjian = require("../models/JadwalUjianModel.js");
const Dosen = require("../models/DosenModel.js");
const Mahasiswa = require("../models/MahasiswaModel.js");
const User = require("../models/UserModel.js");
const PengajuanProposal = require("../models/PengajuanProposalModel.js");

const createJadwalUjian = async (req, res) => {
    const jadwalUjianData = req.body;

    try {
        if (jadwalUjianData.pembimbing) {
            const pembimbingIds = jadwalUjianData.pembimbing.split("|");
            await Promise.all(pembimbingIds.map(id_dosen => {
                return JadwalUjian.create({
                    type: jadwalUjianData.type,
                    jadwal: jadwalUjianData.jadwal,
                    id_mahasiswa: jadwalUjianData.id_mahasiswa,
                    id_prodi: jadwalUjianData.id_prodi,
                    id_dosen: id_dosen
                });
            }));
        }

        if (jadwalUjianData.penguji) {
            const pengujiIds = jadwalUjianData.penguji.split("|");
            await Promise.all(pengujiIds.map(id_dosen => {
                return JadwalUjian.create({
                    type: jadwalUjianData.type,
                    jadwal: jadwalUjianData.jadwal,
                    id_mahasiswa: jadwalUjianData.id_mahasiswa,
                    id_prodi: jadwalUjianData.id_prodi,
                    id_dosen: id_dosen
                });
            }));
        }

        res.json({
            success: true,
            message: "Jadwal ujian created successfully"
        });

    } catch (error) {
        console.error("Error creating jadwal ujian:", error);
        res.status(500).json("Error creating jadwal ujian");
    }
};

const getAllJadwalUjian = async (req, res) => {
    try {
        const jadwalUjianData = await JadwalUjian.findAll();
        res.json(jadwalUjianData);
    } catch (error) {
        console.error("Kesalahan saat mengambil semua jadwal ujian:", error);
        res.status(500).json("Kesalahan saat mengambil semua jadwal ujian");
    }
};

//kerjakan
getMahasiswaByIdProdi = async (req, res) => {
    const { id_prodi } = req.params;

    try {

    } catch (error) {
        console.error("Error retrieving mahasiswa by user Id Prodi:", error);
        res.status(500).json("Error retrieving mahasiswa by user Id Prodi");
    }
}


//request dari fernand
const getJadwalUjianByIds = async (req, res) => {
    const { id_user } = req.params;
    const { page } = req.query;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 5;
    const startIndex = (pageNumber - 1) * pageSize;

    const dataUser = await User.findByPk(id_user);
    if (!dataUser) {
        return res.status(400).json({ error: "User not found" });
    }

    const role = dataUser.role;
    let jadwalUjianData = [];
    let pengajuanProposalDataList = [];

    let baseQuery = {
        attributes: ['id_mahasiswa', [JadwalUjian.sequelize.fn('COUNT', JadwalUjian.sequelize.col('id_mahasiswa')), 'jumlah_dosen']],
        group: ['id_mahasiswa'],
        offset: startIndex,
        limit: pageSize
    };

    try {
        if (role === 'admin') {
            baseQuery.where = { id_prodi: dataUser.id_prodi };
            totalCount = await JadwalUjian.count({ where: baseQuery.where });
        } else if (role === 'mahasiswa') {
            const dataMahasiswa = await Mahasiswa.findOne({ where: { id_user } });
            if (!dataMahasiswa) {
                return res.status(400).json({ error: "Mahasiswa not found" });
            }
            baseQuery.where = { id_mahasiswa: dataMahasiswa.id };
            totalCount = await JadwalUjian.count({ where: baseQuery.where });
        } else if (role === 'dosen') {
            const dataDosen = await Dosen.findOne({ where: { id_user } });
            baseQuery.where = { id_dosen: dataDosen.id };
            totalCount = await JadwalUjian.count({ where: baseQuery.where });
        } else {
            return res.status(403).json({ error: "Akses ditolak" });
        }

        jadwalUjianData = await JadwalUjian.findAll(baseQuery);

        const results = await Promise.all(jadwalUjianData.map(async (data) => {
            const pengajuanProposalData = await PengajuanProposal.findOne({ where: { id_mahasiswa: data.id_mahasiswa } });
            const allDosen = await JadwalUjian.findAll({ where: { id_mahasiswa: data.id_mahasiswa }, attributes: ['id_dosen'] });

            const dosenPembimbingJoin = allDosen.slice(0, 2).map(d => d.id_dosen).join('|');
            const dosenPengujiJoin = allDosen.slice(2).map(d => d.id_dosen).join('|');

            let dosenPembimbing = [];
            let dosenPenguji = [];

            await Promise.all(
                dosenPembimbingJoin.split("|").map(async (id_dosen) => {
                    const bodyData = await Dosen.findByPk(id_dosen);
                    if (bodyData) {
                        dosenPembimbing.push(bodyData.dataValues.nama_dosen);
                    }
                })
            );
            await Promise.all(
                dosenPengujiJoin.split("|").map(async (id_dosen) => {
                    const bodyData = await Dosen.findByPk(id_dosen);
                    if (bodyData) {
                        dosenPenguji.push(bodyData.dataValues.nama_dosen);
                    }
                })
            );

            if (dosenPembimbing) {
                data.setDataValue('dosen_pembimbing', dosenPembimbing);
            }

            if (dosenPenguji) {
                data.setDataValue('dosen_penguji', dosenPenguji);
            }

            const selectedJadwalUjian = await JadwalUjian.findOne({ where: { id_mahasiswa: data.id_mahasiswa } });
            if (selectedJadwalUjian) {
                data.setDataValue('type', selectedJadwalUjian.type);
                data.setDataValue('jadwal', selectedJadwalUjian.jadwal);
            }

            return pengajuanProposalData;
        }));

        pengajuanProposalDataList = results;

        const total_items = jadwalUjianData.length;

        res.json({
            jadwalUjian: jadwalUjianData,
            pengajuanProposal: pengajuanProposalDataList,
            page: pageNumber,
            per_page: pageSize,
            total_items: total_items,
            total_pages: Math.ceil(total_items / pageSize)
        });

    } catch (error) {
        console.error("Error saat mengambil jadwal ujian dan pengajuan proposal:", error);
        res.status(500).json("Error saat mengambil jadwal ujian dan pengajuan proposal");
    }
};

const updateJadwalUjian = async (req, res) => {
    const { id_mahasiswa } = req.params;
    const jadwalUjianData = req.body;

    const updateDosen = async (lamaIds, baruIds) => {
        return Promise.all(lamaIds.map(async (id_dosen_lama, index) => {
            const id_dosen_baru = baruIds[index];
            if (id_dosen_lama !== id_dosen_baru) {
                const existingData = await JadwalUjian.findOne({ where: { id_mahasiswa, id_dosen: id_dosen_lama } });
                if (existingData) {
                    await existingData.update({ ...jadwalUjianData, id_dosen: id_dosen_baru });
                }
            }
        }));
    };

    try {
        if (jadwalUjianData.pembimbing && jadwalUjianData.pembimbingLama) {
            await updateDosen(jadwalUjianData.pembimbingLama.split("|"), jadwalUjianData.pembimbing.split("|"));
        }

        if (jadwalUjianData.penguji && jadwalUjianData.pengujiLama) {
            await updateDosen(jadwalUjianData.pengujiLama.split("|"), jadwalUjianData.penguji.split("|"));
        }

        res.json("Data jadwal ujian berhasil di-update.");
    } catch (error) {
        console.error("Error saat memperbarui jadwal ujian:", error);
        res.status(500).json("Error saat memperbarui jadwal ujian.");
    }
};


module.exports = {
    createJadwalUjian,
    getAllJadwalUjian,
    getJadwalUjianByIds,
    updateJadwalUjian,
};
