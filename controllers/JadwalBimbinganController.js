const JadwalBimbingan = require("../models/JadwalBimbinganModel.js");

const createJadwalBimbingan = async (req, res) => {
    const jadwalBimbinganData = req.body;
    console.log(req.file);

    try {
        await JadwalBimbingan.create({
            jadwal: jadwalBimbinganData.jadwal,
            document_name: req.file.filename,
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
    try {
        const jadwalBimbinganData = await JadwalBimbingan.findAll({
            where: { status: 0 }
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
    const { page } = req.query;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 10;
    const startIndex = (pageNumber - 1) * pageSize;

    try {
        const totalCount = await JadwalBimbingan.count({
            where: { status: 1 }
        });

        const jadwalBimbinganData = await JadwalBimbingan.findAll({
            where: { status: 1 },
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
        console.error("Error retrieving paginated jadwal bimbingan with status 1:", error);
        res.status(500).json("Error retrieving paginated jadwal bimbingan with status 1");
    }
};

const getJadwalBimbinganByStatus = async (req, res) => {
    const { status } = req.params

    try {
        const jadwalBimbinganData = await JadwalBimbingan.findAll({
            where: { status: status }
        });
        if (!jadwalBimbinganData) {
            return res.status(404).json({ error: "Status not found" });
        }
        res.json({ item: jadwalBimbinganData })
    } catch (error) {
        console.error("Error retrieving jadwal bimbingan by status:", error);
        res.status(500).json("Error retrieving status");
    }
}

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
    getJadwalBimbinganByStatus,
    updateJadwalBimbingan,
};
