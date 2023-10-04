const express = require("express");
const {
    createMahasiswa,
    getAllMahasiswa,
    getMahasiswabyUserId,
    getPaginationMahasiswa,
    updateMahasiswa
} = require("../controllers/MahasiswaController.js");

const router = express.Router();

router.get("/mahasiswa", getAllMahasiswa);
router.get("/mahasiswa/pagination", getPaginationMahasiswa);
router.get("/mahasiswa/:id_user", getMahasiswabyUserId);
router.post("/mahasiswa/create", createMahasiswa);
router.patch("/mahasiswa/:id", updateMahasiswa);

module.exports = router;
