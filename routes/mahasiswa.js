const express = require("express");
const {
    createMahasiswa,
    getAllMahasiswa,
    getMahasiswabyUserId,
    getPaginationMahasiswa,
} = require("../controllers/MahasiswaController.js");

const router = express.Router();

router.get("/mahasiswa", getAllMahasiswa);
router.get("/mahasiswa/pagination/:id_user", getPaginationMahasiswa);
router.get("/mahasiswa/:id_user", getMahasiswabyUserId);
router.post("/mahasiswa/create", createMahasiswa);

module.exports = router;
