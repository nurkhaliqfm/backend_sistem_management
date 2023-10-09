const express = require("express");
const {
    createJadwalUjian,
    updateJadwalUjian,
    getAllJadwalUjian,
    getJadwalUjianByIds,
} = require("../controllers/JadwalUjianController.js");

const router = express.Router();

router.post("/jadwal-ujian", createJadwalUjian);
router.get("/jadwal-ujian", getAllJadwalUjian);
router.get('/jadwal-ujian/:id_user', getJadwalUjianByIds);
// router.patch("/jadwal-ujian/:id", updateJadwalUjian);
router.patch('/jadwal-ujian/:id_mahasiswa', updateJadwalUjian);

module.exports = router;
