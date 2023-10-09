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

const getJadwalUjianByIds = async (req, res) => {
    const { id_user } = req.params;

    const dataUser = await User.findByPk(id_user);
    if (!dataUser) {
        return res.status(400).json({ error: "User not found" });
    }

    const role = dataUser.role;
    let whereConditions = {};
    let jadwalUjianData = [];
    let pengajuanProposalDataList = [];

    try {
        if (role === 'admin') {
            const groupingCondition = {
                attributes: ['id_mahasiswa', [JadwalUjian.sequelize.fn('COUNT', JadwalUjian.sequelize.col('id_mahasiswa')), 'jumlah_ujian']],
                group: ['id_mahasiswa'],
                where: { id_prodi: dataUser.id_prodi }
            };
            jadwalUjianData = await JadwalUjian.findAll(groupingCondition);
        } else if (role === 'mahasiswa') {
            const dataMahasiswa = await Mahasiswa.findOne({ where: { id_user: id_user } });
            if (!dataMahasiswa) {
                return res.status(400).json({ error: "Mahasiswa not found" });
            }

            whereConditions.id_mahasiswa = dataMahasiswa.id;
            jadwalUjianData = await JadwalUjian.findAll({
                where: whereConditions,
                attributes: ['id_mahasiswa', [JadwalUjian.sequelize.fn('COUNT', JadwalUjian.sequelize.col('id_mahasiswa')), 'jumlah_ujian']],
                group: ['id_mahasiswa']
            });

        } else if (role === 'dosen') {
            const dataDosen = await Dosen.findOne({ where: { id_user: id_user } });
            whereConditions.id_dosen = dataDosen.id;
            jadwalUjianData = await JadwalUjian.findAll({ where: whereConditions });
        } else {
            return res.status(403).json({ error: "Akses ditolak" });
        }

        for (const data of jadwalUjianData) {
            const pengajuanProposalData = await PengajuanProposal.findOne({ where: { id_mahasiswa: data.id_mahasiswa } });
            pengajuanProposalDataList.push(pengajuanProposalData);
        }

        res.json({
            jadwalUjian: jadwalUjianData,
            pengajuanProposal: pengajuanProposalDataList
        });

    } catch (error) {
        console.error("Error saat mengambil jadwal ujian dan pengajuan proposal:", error);
        res.status(500).json("Error saat mengambil jadwal ujian dan pengajuan proposal");
    }
};

// const updateJadwalUjian = async (req, res) => {
//     const jadwalUjianData = req.body;

//     try {
//         await JadwalUjian.update(jadwalUjianData, {
//             where: {
//                 id: req.params.id,
//             },
//         });
//         res.json("Data jadwal berhasil di-update.");
//     } catch (error) {
//         console.error("Error updating jadwal:", error);
//         res.status(500).json("Error updating jadwal");
//     }
// };

const updateJadwalUjian = async (req, res) => {
    const { id_mahasiswa } = req.params;
    const jadwalUjianData = req.body;

    try {
        if (jadwalUjianData.pembimbing && jadwalUjianData.pembimbingLama) {
            const pembimbingIds = jadwalUjianData.pembimbing.split("|");
            const pembimbingLamaIds = jadwalUjianData.pembimbingLama.split("|");

            await Promise.all(pembimbingLamaIds.map(async (id_dosen_lama, index) => {
                const id_dosen_baru = pembimbingIds[index];
                const existingData = await JadwalUjian.findOne({ where: { id_mahasiswa, id_dosen: id_dosen_lama } });
                if (existingData) {
                    await JadwalUjian.update({ id_dosen: id_dosen_baru, ...jadwalUjianData }, { where: { id_mahasiswa, id_dosen: id_dosen_lama } });
                }
            }));
        }

        if (jadwalUjianData.penguji && jadwalUjianData.pengujiLama) {
            const pengujiIds = jadwalUjianData.penguji.split("|");
            const pengujiLamaIds = jadwalUjianData.pengujiLama.split("|");

            await Promise.all(pengujiLamaIds.map(async (id_dosen_lama, index) => {
                const id_dosen_baru = pengujiIds[index];
                const existingData = await JadwalUjian.findOne({ where: { id_mahasiswa, id_dosen: id_dosen_lama } });
                if (existingData) {
                    await JadwalUjian.update({ id_dosen: id_dosen_baru, ...jadwalUjianData }, { where: { id_mahasiswa, id_dosen: id_dosen_lama } });
                }
            }));
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
