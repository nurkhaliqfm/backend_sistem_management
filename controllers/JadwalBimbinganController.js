const JadwalBimbingan = require("../models/JadwalBimbinganModel.js");

const createJadwalBimbingan = async (req, res) => {
    const jadwalBimbinganData = req.body;

    try {
        await JadwalBimbingan.create({
            jadwal: jadwalBimbinganData.jadwal,
            status: jadwalBimbinganData.status,
            id_mahasiswa: jadwalBimbinganData.id_mahasiswa,
            id_dosen: jadwalBimbinganData.id_dosen,
        })
        res.json("success");
    } catch (error) {
        console.error("Error creating jadwal bimbingan:", error);
        res.status(500).json("Error creating jadwal bimbingan");
    }
}

const getAllJadwalBimbingan = async (req, res) => {
    try {
        const jadwalBimbinganData = await JadwalBimbingan.findAll();
        res.json(jadwalBimbinganData);
    } catch (error) {
        console.error("Kesalahan saat mengambil semua jadwal bimbingan:", error);
        res.status(500).json("Kesalahan saat mengambil semua jadwal bimbingan");
    }
}

const updateJadwalBimbingan = async (req, res) => {
    const jadwalBimbinganData = req.body;

    try {
        await JadwalBimbingan.update(jadwalBimbinganData, {
            where: {
                id: req.params.id
            }
        })
        res.json("Data jadwal berhasil di-update.");
    } catch (error) {
        console.error("Error updating jadwal:", error);
        res.status(500).json("Error updating jadwal");
    }
}

module.exports = {
    createJadwalBimbingan,
    getAllJadwalBimbingan,
    updateJadwalBimbingan
}