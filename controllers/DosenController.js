const Dosen = require("../models/DosenModel.js");
const Prodi = require("../models/ProdiModel.js");
const User = require("../models/UserModel.js");
const { Op } = require('sequelize');

const createDosen = async (req, res) => {
    const dosenData = req.body;
    //create user juga
    try {
        const newUser = await User.create({
            username: dosenData.username,
            password: dosenData.password,
            role: 'dosen',
        });
        await Dosen.create({
            nama_dosen: dosenData.nama_dosen,
            nip: dosenData.nip,
            nidn: dosenData.nidn,
            dosen_type: dosenData.dosen_type,
            dosen_profile: dosenData.dosen_profile,
            id_prodi: dosenData.id_prodi,
            id_user: newUser.id,
        });
        res.json("success");
    } catch (error) {
        console.error("Error creating dosen:", error);
        res.status(500).json("Error creating dosen");
    }
};

const getAllDosen = async (req, res) => {
    const dosenData = await Dosen.findAll();

    res.json(dosenData);
};

const getDosenByUserId = async (req, res) => {
    const { id_user } = req.params;

    try {
        const dosenData = await Dosen.findOne({
            where: { id_user: id_user },
        });

        if (!dosenData) {
            return res.status(404).json({ error: "Dosen not found" });
        }

        const prodiData = await Prodi.findOne({
            where: { id: dosenData.id_prodi }
        })

        const data = {
            id: dosenData.id,
            nama_prodi: prodiData.nama_resmi,
            nama_dosen: dosenData.nama_dosen,
            nip: dosenData.nip,
            nidn: dosenData.nidn,
            dosen_type: dosenData.dosen_type,
            dosen_profile: dosenData.dosen_profile
        }

        res.json(data);
    } catch (error) {
        console.error("Error retrieving dosen by user ID:", error);
        res.status(500).json("Error retrieving dosen");
    }
};

const getDosenByIdDosen = async (req, res) => {
    const { id_dosen } = req.params;
    try {
        const dosenData = await Dosen.findOne({
            where: { id: id_dosen }
        });

        if (!dosenData) {
            return res.status(404).json({ error: "Dosen tidak ditemukan" });
        }

        const data = {
            id: dosenData.id,
            nama_dosen: dosenData.nama_dosen,
            nip: dosenData.nip,
            nidn: dosenData.nidn,
            dosen_type: dosenData.dosen_type,
        }
        res.json(data)
    } catch (error) {
        console.error("Error saat mengambil data dosen berdasarkan id dosen:", error);
        res.status(500).json({ error: "Error saat mengambil data dosen berdasarkan id dosen" });
    }
}

const getPaginationDosen = async (req, res) => {
    const { page, search } = req.query;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 5;
    const startIndex = (pageNumber - 1) * pageSize;

    const whereCondition = {};

    // Menambahkan kondisi pencarian berdasarkan nama dosen
    if (search) {
        whereCondition.nama_dosen = {
            [Op.like]: `%${search}%`
        };
    }

    try {
        const totalCount = await Dosen.count({
            where: whereCondition,
        });

        const dosenData = await Dosen.findAll({
            where: whereCondition,
            offset: startIndex,
            limit: pageSize,
        });

        res.json({
            item: dosenData,
            page: pageNumber,
            per_page: pageSize,
            limit: pageSize,
            total_items: totalCount,
            total_pages: Math.ceil(totalCount / pageSize),
        });
    } catch (error) {
        console.error("Error retrieving paginated dosen:", error);
        res.status(500).json("Error retrieving paginated dosen");
    }
};

const updateDosen = async (req, res) => {
    const dosenData = req.body;

    try {
        await Dosen.update(dosenData, {
            where: {
                id: req.params.id,
            },
        });
        res.json("Data dosen berhasil di-update.");
    } catch (error) {
        console.error("Error updating dosen:", error);
        res.status(500).json("Error updating dosen");
    }
};

module.exports = {
    createDosen,
    getAllDosen,
    getDosenByUserId,
    getDosenByIdDosen,
    getPaginationDosen,
    updateDosen,
};
