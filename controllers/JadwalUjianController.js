const JadwalUjian = require('../models/JadwalUjianModel.js');

const createJadwalUjian = async (req, res) => {
    const jadwalUjianData = req.body;

    try {
        await JadwalUjian.create({
            type: jadwalUjianData.type,
            jadwal: jadwalUjianData.jadwal,
            id_mahasiswa: jadwalUjianData.id_mahasiswa
        })
    } catch (error) {
        console.error("Error creating jadwal ujian:", error);
        res.status(500).json("Error creating jadwal ujian");
    }
}

const updateJadwalUjian = async (req, res) => {
    const jadwalUjianData = req.body;

    try {
        await JadwalUjian.update(jadwalUjianData, {
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
    createJadwalUjian,
    updateJadwalUjian
}