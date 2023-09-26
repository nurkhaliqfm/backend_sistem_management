const express = require("express");
const {
    createJadwalBimbingan,
    updateJadwalBimbingan,
    getAllJadwalBimbingan,
} = require("../controllers/JadwalBimbinganController.js");

const router = express.Router();

router.post("/jadwal-bimbingan", createJadwalBimbingan);
router.get("/jadwal-bimbingan", getAllJadwalBimbingan);
router.patch("/jadwal-bimbingan/:id", updateJadwalBimbingan);

module.exports = router;
