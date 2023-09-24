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
            id_user: dosenData.id_user
        });
        res.json("success");
    } catch (error) {
        console.error("Error creating dosen:", error);
        res.status(500).json("Error creating dosen");
    }
}

const updateDosen = async (req, res) => {
    const dosenData = req.body;

    try {
        await Dosen.update(dosenData, {
            where: {
                id: req.params.id
            }
        });
        res.json("Data dosen berhasil di-update.");
    } catch (error) {
        console.error("Error updating dosen:", error);
        res.status(500).json("Error updating dosen");
    }
}

module.exports = {
    createDosen,
    updateDosen
}