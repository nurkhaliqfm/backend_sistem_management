const express = require("express");
const {
    createDosen,
    getAllDosen,
    getDosenByUserId,
    getDosenByIdDosen,
    getPaginationDosen,
    updateDosen,
} = require("../controllers/DosenController.js");

const router = express.Router();

router.get("/dosen", getAllDosen);
router.get("/dosen/pagination", getPaginationDosen);
router.get("/dosen/:id_user", getDosenByUserId);
router.get("/dosen/dsnid/:id_dosen", getDosenByIdDosen);
router.patch("/dosen/:id", updateDosen);
router.post("/dosen", createDosen);

module.exports = router;
