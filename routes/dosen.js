const express = require("express");
const {
    createDosen,
    getAllDosen,
    getDosenByUserId,
    getPaginationDosen,
    updateDosen,
} = require("../controllers/DosenController.js");

const router = express.Router();

router.get("/dosen", getAllDosen);
router.get("/dosen/pagination/:id_user", getPaginationDosen);
router.get("/dosen/:id_user", getDosenByUserId);
router.patch("/dosen/:id", updateDosen);
router.post("/dosen", createDosen);

module.exports = router;
