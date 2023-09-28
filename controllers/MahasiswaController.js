const { Op } = require("sequelize");
const Mahasiswa = require("../models/MahasiswaModel.js");
const Prodi = require("../models/ProdiModel.js");

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
                const prodi = await Prodi.findOne({
                    where: { id: mahasiswa.id_prodi },
                });
                return {
                    ...mahasiswa.dataValues,
                    nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                    pembimbing: mahasiswa.pembimbing.split("|"),
                    penguji: mahasiswa.penguji.split("|"),
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
    const pageSize = 10;
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
                const prodi = await Prodi.findOne({
                    where: { id: mahasiswa.id_prodi },
                });
                return {
                    ...mahasiswa.dataValues,
                    nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                    pembimbing: mahasiswa.pembimbing.split("|"),
                    penguji: mahasiswa.penguji.split("|"),
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

        const data = {
            id: mahasiswaData.id,
            nama_prodi: prodiData ? prodiData.nama_resmi : "N/A",
            nama_mahasiswa: mahasiswaData.nama_mahasiswa,
            nim: mahasiswaData.nim,
            angkatan: mahasiswaData.angkatan,
            status: mahasiswaData.status,
            pembimbing: mahasiswaData.pembimbing.split("|"),
            penguji: mahasiswaData.penguji.split("|"),
            judul: mahasiswaData.judul,
            mahasiwa_profile: mahasiswaData.mahasiswa_profile,
        };

        res.json(data);
    } catch (error) {
        console.error("Error retrieving mahasiswa by user ID:", error);
        res.status(500).json("Error retrieving mahasiswa");
    }
};

module.exports = {
    createMahasiswa,
    getAllMahasiswa,
    getMahasiswabyUserId,
    getPaginationMahasiswa,
};
