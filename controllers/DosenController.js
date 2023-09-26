const Dosen = require("../models/DosenModel.js");

const createDosen = async (req, res) => {
    const dosenData = req.body;

    try {
        await Dosen.create({
            nama_dosen: dosenData.nama_dosen,
            nip: dosenData.nip,
            dosen_type: dosenData.dosen_type,
            dosen_profile: dosenData.dosen_profile,
            id_prodi: dosenData.id_prodi,
            id_user: dosenData.id_user,
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
        res.json(dosenData);
    } catch (error) {
        console.error("Error retrieving dosen by user ID:", error);
        res.status(500).json("Error retrieving dosen");
    }
};

const getPaginationDosen = async (req, res) => {
    const { page } = req.query;
    const { id_user } = req.params;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 10;

    const startIndex = (pageNumber - 1) * pageSize;

    const dosenData = await Dosen.findAll({
        where: { id_user: id_user },
    });

    const paginatedItems = dosenData.slice(startIndex, startIndex + pageSize);

    res.json({
        page: pageNumber,
        limit: pageSize,
        totalItems: dosenData.length,
        totalPages: Math.ceil(dosenData.length / pageSize),
        item: paginatedItems,
    });
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
    getPaginationDosen,
    updateDosen,
};
