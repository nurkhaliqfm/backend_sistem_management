const JadwalBimbingan = require("../models/JadwalBimbinganModel.js");

const createJadwalBimbingan = async (req, res) => {
    const jadwalBimbinganData = req.body;
    console.log(req.file);
    try {
        const document_name = req.file ? req.file.filename : null;

        await JadwalBimbingan.create({
            jadwal: jadwalBimbinganData.jadwal,
            document_name: document_name,
            status: jadwalBimbinganData.status,
            id_mahasiswa: jadwalBimbinganData.id_mahasiswa,
            id_dosen: jadwalBimbinganData.id_dosen,
        });

        res.json("success");
    } catch (error) {
        console.error("Error creating jadwal bimbingan:", error);
        res.status(500).json("Error creating jadwal bimbingan");
    }
};


const getAllJadwalBimbingan = async (req, res) => {
    try {
        const jadwalBimbinganData = await JadwalBimbingan.findAll();
        res.json(jadwalBimbinganData);
    } catch (error) {
        console.error("Kesalahan saat mengambil semua jadwal bimbingan:", error);
        res.status(500).json("Kesalahan saat mengambil semua jadwal bimbingan");
    }
};

const getJadwalBimbinganPending = async (req, res) => {
    const { id_mahasiswa } = req.params;
    try {
        const jadwalBimbinganData = await JadwalBimbingan.findAll({
            where: {
                status: 0,
                id_mahasiswa: id_mahasiswa
            } //by id_mahasiswa
        });

        if (!jadwalBimbinganData) {
            return res.status(404).json({ error: "Pending Jadwal Bimbingan not found" });
        }
        res.json({ item: jadwalBimbinganData })
    } catch (error) {
        console.error("Error retrieving Jadwal Bimbingan with pending status:", error);
        res.status(500).json("Error retrieving Jadwal Bimbingan with pending status");
    }
};

const getPaginationJadwalBimbingan = async (req, res) => {
    const { page, status } = req.query;
    const { id_mahasiswa } = req.params;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 5;
    const startIndex = (pageNumber - 1) * pageSize;

    const whereConditions = {
        id_mahasiswa,
        status: status ? parseInt(status, 10) : 1
    };

    try {
        const totalCount = await JadwalBimbingan.count({
            where: whereConditions
        });

        const jadwalBimbinganData = await JadwalBimbingan.findAll({
            where: whereConditions,
            order: [['createdAt', 'DESC']],
            offset: startIndex,
            limit: pageSize,
        });

        res.json({
            item: jadwalBimbinganData,
            page: pageNumber,
            per_page: pageSize,
            totalItems: totalCount,
            totalPages: Math.ceil(totalCount / pageSize),
        });
    } catch (error) {
        console.error("Error retrieving paginated jadwal bimbingan:", error);
        res.status(500).json("Error retrieving paginated jadwal bimbingan");
    }
};

const updateJadwalBimbingan = async (req, res) => {
    const jadwalBimbinganData = req.body;
    const jadwalId = req.params.id;

    try {
        const existingJadwal = await JadwalBimbingan.findByPk(jadwalId);

        if (!existingJadwal) {
            return res.status(404).json("Jadwal Bimbingan not found");
        }

        if (req.file) {
            jadwalBimbinganData.document_name = req.file.filename;
        }
        console.log(req.file);

        await JadwalBimbingan.update(jadwalBimbinganData, {
            where: {
                id: jadwalId,
            },
        });

        res.json("Jadwal Bimbingan updated successfully");
    } catch (error) {
        console.error("Error updating Jadwal Bimbingan:", error);
        res.status(500).json("Error updating Jadwal Bimbingan");
    }
};


module.exports = {
    createJadwalBimbingan,
    getAllJadwalBimbingan,
    getJadwalBimbinganPending,
    getPaginationJadwalBimbingan,
    updateJadwalBimbingan,
};
