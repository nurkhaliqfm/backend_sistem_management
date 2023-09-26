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

// const getAllMahasiswa = async (req, res) => {
//     try {
//         const mahasiswaData = await Mahasiswa.findAll();

//         const modifiedMahasiswaData = mahasiswaData.map(mahasiswa => {
//             return {
//                 ...mahasiswa.dataValues,
//                 pembimbing: mahasiswa.pembimbing.split("|"),
//                 penguji: mahasiswa.penguji.split("|")
//             };
//         });

//         res.json(modifiedMahasiswaData);
//     } catch (error) {
//         console.error("Error retrieving all mahasiswa:", error);
//         res.status(500).json("Error retrieving all mahasiswa");
//     }
// };

const getAllMahasiswa = async (req, res) => {
    try {
        const mahasiswaData = await Mahasiswa.findAll();

        const modifiedMahasiswaData = await Promise.all(mahasiswaData.map(async mahasiswa => {
            const prodi = await Prodi.findOne({ where: { id: mahasiswa.id_prodi } });
            return {
                ...mahasiswa.dataValues,
                nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                pembimbing: mahasiswa.pembimbing.split("|"),
                penguji: mahasiswa.penguji.split("|")
            };
        }));
        res.json(modifiedMahasiswaData);
    } catch (error) {
        console.error("Error retrieving all mahasiswa:", error);
        res.status(500).json("Error retrieving all mahasiswa");
    }
};


const getPaginationMahasiswa = async (req, res) => {
    const { page } = req.query;
    const { id_user } = req.params;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 10;
    const startIndex = (pageNumber - 1) * pageSize;

    try {
        const mahasiswaData = await Mahasiswa.findAll({
            where: { id_user: id_user },
        });

        const modifiedMahasiswaData = await Promise.all(mahasiswaData.map(async mahasiswa => {
            const prodi = await Prodi.findOne({ where: { id: mahasiswa.id_prodi } });
            return {
                ...mahasiswa.dataValues,
                nama_prodi: prodi ? prodi.nama_resmi : "N/A",
                pembimbing: mahasiswa.pembimbing.split("|"),
                penguji: mahasiswa.penguji.split("|")
            };
        }));

        const paginatedItems = modifiedMahasiswaData.slice(startIndex, startIndex + pageSize);

        res.json({
            page: pageNumber,
            limit: pageSize,
            totalItems: modifiedMahasiswaData.length,
            totalPages: Math.ceil(modifiedMahasiswaData.length / pageSize),
            items: paginatedItems,
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
