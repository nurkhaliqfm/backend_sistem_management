const JadwalUjian = require("../models/JadwalUjianModel.js");
const Dosen = require("../models/DosenModel.js");
const Mahasiswa = require("../models/MahasiswaModel.js");

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



const updateJadwalUjian = async (req, res) => {
    const jadwalUjianData = req.body;

    try {
        await JadwalUjian.update(jadwalUjianData, {
            where: {
                id: req.params.id,
            },
        });
        res.json("Data jadwal berhasil di-update.");
    } catch (error) {
        console.error("Error updating jadwal:", error);
        res.status(500).json("Error updating jadwal");
    }
};

module.exports = {
    createJadwalUjian,
    getAllJadwalUjian,
    updateJadwalUjian,
};
