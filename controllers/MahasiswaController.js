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
    const mahasiswaData = await Mahasiswa.findAll();

    res.json(mahasiswaData);
};

const getMahasiswabyUserId = async (req, res) => {
    const { id_user } = req.params;
    try {
        const mahasiswaData = await Mahasiswa.findOne({
            where: { id_user: id_user },
        });

        const prodiData = await Prodi.findOne({
            where: { id: mahasiswaData.id_prodi }
        })

        const data = {
            id: mahasiswaData.id,
            nama_prodi: prodiData.nama_resmi,
            nama_mahasiswa: mahasiswaData.nama_mahasiswa,
            nim: mahasiswaData.nim,
            angkatan: mahasiswaData.angkatan,
            status: mahasiswaData.status,
            pembimbing: mahasiswaData.pembimbing.split('|'),
            penguji: mahasiswaData.penguji.split('|'),
            judul: mahasiswaData.judul,
            mahasiwa_profile: mahasiswaData.mahasiswa_profile
        }

        if (!mahasiswaData) {
            return res.status(404).json({ error: "Mahasiswa not found" });
        }

        res.json(data);
    } catch (error) {
        console.error("Error retrieving mahasiswa by user ID:", error);
        res.status(500).json("Error retrieving mahasiswa");
    }
};

module.exports = { createMahasiswa, getAllMahasiswa, getMahasiswabyUserId };

