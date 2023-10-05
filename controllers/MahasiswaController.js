const { Op } = require("sequelize");
const Mahasiswa = require("../models/MahasiswaModel.js");
const Prodi = require("../models/ProdiModel.js");
const Dosen = require("../models/DosenModel.js");

const createMahasiswa = async (req, res) => {
    const mahasiswaData = req.body;

    try {
        await Mahasiswa.create({
            nama_mahasiswa: mahasiswaData.nama_mahasiswa,
            nim: mahasiswaData.nim,
            angkatan: mahasiswaData.angkatan,
            status: mahasiswaData.status,
            pembimbing: mahasiswaData.pembimbing,
            penguji: mahasiswaData.penguji,
            judul: mahasiswaData.judul,
            mahasiswa_profile: mahasiswaData.mahasiswa_profile,
            id_prodi: mahasiswaData.id_prodi,
            id_user: mahasiswaData.id_user,
            id_neosia: mahasiswaData.id_neosia,
        });
        res.json("success");
    } catch (error) {
        console.error("Error creating mahasiswa:", error);
        res.status(500).json("Error creating mahasiswa");
    }
};

const getAllMahasiswa = async (req, res) => {
    try {
        const mahasiswaData = await Mahasiswa.findAll();

        const modifiedMahasiswaData = await Promise.all(
            mahasiswaData.map(async (mahasiswa) => {

                let dosenPembimbing = [];
                let dosenPenguji = [];

                const prodi = await Prodi.findOne({
                    where: { id: mahasiswa.id_prodi },
                });

                await Promise.all(
                    mahasiswa.pembimbing.split("|").map(async (id_dosen) => {
                        const bodyData = await Dosen.findByPk(id_dosen)
                        if (bodyData) {
                            dosenPembimbing.push(bodyData.dataValues.nama_dosen);
                        }
                    })
                )

                await Promise.all(
                    mahasiswa.penguji.split("|").map(async (id_dosen) => {
                        const bodyData = await Dosen.findByPk(id_dosen)
                        if (bodyData) {
                            dosenPenguji.push(bodyData.dataValues.nama_dosen);
                        }
                    })
                )

                return {
                    ...mahasiswa.dataValues,
                    nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                    pembimbing: dosenPembimbing,
                    penguji: dosenPenguji,
                };
            })
        );
        res.json(modifiedMahasiswaData);
    } catch (error) {
        console.error("Error retrieving all mahasiswa:", error);
        res.status(500).json("Error retrieving all mahasiswa");
    }
};

const getPaginationMahasiswa = async (req, res) => {
    const { page, search, sortField, sortOrder } = req.query;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 5;
    const startIndex = (pageNumber - 1) * pageSize;

    const whereCondition = {};

    if (search) {
        whereCondition.nama_mahasiswa = {
            [Op.like]: `%${search}%`,
        };
    }
    console.log(whereCondition);

    const validSortFields = ['angkatan', 'status'];
    const orderConfig =
        sortField && sortOrder && validSortFields.includes(sortField)
            ? [[sortField, sortOrder]]
            : [['angkatan', 'ASC'], ['status', 'ASC']];

    try {
        const totalCount = await Mahasiswa.count({
            where: whereCondition,
        });

        const mahasiswaData = await Mahasiswa.findAll({
            where: whereCondition,
            offset: startIndex,
            limit: pageSize,
            order: orderConfig,
        });

        const modifiedMahasiswaData = await Promise.all(
            mahasiswaData.map(async (mahasiswa) => {

                let dosenPembimbing = [];
                let dosenPenguji = [];

                const prodi = await Prodi.findOne({
                    where: { id: mahasiswa.id_prodi },
                });

                await Promise.all(
                    mahasiswa.pembimbing.split("|").map(async (id_dosen) => {
                        const bodyData = await Dosen.findByPk(id_dosen)
                        if (bodyData) {
                            dosenPembimbing.push(bodyData.dataValues.nama_dosen);
                        }
                    })
                );

                await Promise.all(
                    mahasiswa.penguji.split("|").map(async (id_dosen) => {
                        const bodyData = await Dosen.findByPk(id_dosen)
                        if (bodyData) {
                            dosenPenguji.push(bodyData.dataValues.nama_dosen);
                        }
                    })
                );

                return {
                    ...mahasiswa.dataValues,
                    nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                    pembimbing: dosenPembimbing,
                    penguji: dosenPenguji,
                };
            })
        );

        res.json({
            item: modifiedMahasiswaData,
            page: pageNumber,
            per_page: pageSize,
            total_items: totalCount,
            total_pages: Math.ceil(totalCount / pageSize),
            search: search,
            sort_field: sortField || "createdAt",
            sort_order: sortOrder || "ASC",
        });
    } catch (error) {
        console.error("Error retrieving paginated mahasiswa:", error);
        res.status(500).json("Error retrieving paginated mahasiswa");
    }
};


const getMahasiswabyUserId = async (req, res) => {
    const { id_user } = req.params;
    try {
        const mahasiswaData = await Mahasiswa.findOne({
            where: { id_user: id_user },
        });

        if (!mahasiswaData) {
            return res.status(404).json({ error: "Mahasiswa not found" });
        }

        const prodiData = await Prodi.findOne({
            where: { id: mahasiswaData.id_prodi },
        });

        let dosenPembimbing = [];
        let dosenPenguji = [];

        await Promise.all(
            mahasiswaData.pembimbing.split("|").map(async (id_dosen) => {
                const bodyData = await Dosen.findByPk(id_dosen)
                if (bodyData) {
                    dosenPembimbing.push(bodyData.dataValues.nama_dosen);
                }
            })
        )

        await Promise.all(
            mahasiswaData.penguji.split("|").map(async (id_dosen) => {
                const bodyData = await Dosen.findByPk(id_dosen)
                if (bodyData) {
                    dosenPenguji.push(bodyData.dataValues.nama_dosen);
                }
            })
        )

        const data = {
            id: mahasiswaData.id,
            nama_prodi: prodiData ? prodiData.nama_resmi : "N/A",
            nama_mahasiswa: mahasiswaData.nama_mahasiswa,
            nim: mahasiswaData.nim,
            angkatan: mahasiswaData.angkatan,
            status: mahasiswaData.status,
            pembimbing: dosenPembimbing,
            penguji: dosenPenguji,
            judul: mahasiswaData.judul,
            mahasiswa_profile: mahasiswaData.mahasiswa_profile,
        };

        res.json(data);
    } catch (error) {
        console.error("Error retrieving mahasiswa by user ID:", error);
        res.status(500).json("Error retrieving mahasiswa");
    }
};


const getMahasiswaByIdMahasiswa = async (req, res) => {
    const { id_mahasiswa } = req.params;
    try {
        const mahasiswaData = await Mahasiswa.findOne({
            where: { id_mahasiswa: id_mahasiswa },
        });

        if (!mahasiswaData) {
            return res.status(404).json({ error: "Mahasiswa tidak ditemukan" });
        }

        const prodiData = await Prodi.findOne({
            where: { id: mahasiswaData.id_prodi },
        });

        let dosenPembimbing = [];
        let dosenPenguji = [];

        await Promise.all(
            mahasiswaData.pembimbing.split("|").map(async (id_dosen) => {
                const bodyData = await Dosen.findByPk(id_dosen)
                if (bodyData) {
                    dosenPembimbing.push(bodyData.dataValues.nama_dosen);
                }
            })
        )

        await Promise.all(
            mahasiswaData.penguji.split("|").map(async (id_dosen) => {
                const bodyData = await Dosen.findByPk(id_dosen)
                if (bodyData) {
                    dosenPenguji.push(bodyData.dataValues.nama_dosen);
                }
            })
        )

        const data = {
            id: mahasiswaData.id,
            nama_prodi: prodiData ? prodiData.nama_resmi : "N/A",
            nama_mahasiswa: mahasiswaData.nama_mahasiswa,
            nim: mahasiswaData.nim,
            angkatan: mahasiswaData.angkatan,
            status: mahasiswaData.status,
            pembimbing: dosenPembimbing,
            penguji: dosenPenguji,
            judul: mahasiswaData.judul,
            mahasiswa_profile: mahasiswaData.mahasiswa_profile,
        };

        res.json(data);
    } catch (error) {
        console.error("Error saat mengambil data mahasiswa berdasarkan id mahasiswa:", error);
        res.status(500).json({ error: "Error saat mengambil data mahasiswa berdasarkan id mahasiswa" });
    }
};



const updateMahasiswa = async (req, res) => {
    const mahasiswaData = req.body;

    try {
        await Mahasiswa.update(mahasiswaData, {
            where: {
                id: req.params.id,
            },
        });
        res.json("Mahasiswa berhasil di-update.");
    } catch (error) {
        console.error("Error updating mahasiswa:", error);
        res.status(500).json("Error updating mahasiswa");
    }
};

module.exports = {
    createMahasiswa,
    getAllMahasiswa,
    getMahasiswabyUserId,
    getMahasiswaByIdMahasiswa,
    getPaginationMahasiswa,
    updateMahasiswa
};
