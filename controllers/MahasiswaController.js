const Mahasiswa = require("../models/MahasiswaModel.js");

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
        });
        res.json("success");
    } catch (error) {
        console.error("Error creating mahasiswa:", error);
        res.status(500).json("Error creating mahasiswa");
    }
};

const getAllMahasiswa = async (req, res) => {
    const mahasiswaData = await Mahasiswa.findAll();

    res.json(mahasiswaData);
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

        res.json(mahasiswaData);
    } catch (error) {
        console.error("Error retrieving mahasiswa by user ID:", error);
        res.status(500).json("Error retrieving mahasiswa");
    }
};

module.exports = { createMahasiswa, getAllMahasiswa, getMahasiswabyUserId };

