const express = require("express");
const {
    createOrUpdateProposal,
    updateProposal,
    getAllProposal,
    getPaginationProposal,
    getProposalByMahasiswaId
} = require("../controllers/PengajuanProposalController.js");
const router = express.Router();

const multer = require("multer");
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "assets/proposal");
    },

    filename: function (req, file, cb) {
        // Membuat nama file unik dengan timestamp
        cb(null, Date.now() + "-" + file.originalname);
    },
});

const fileFilter = (req, file, cb) => {
    // Hanya mengizinkan file .pdf
    if (file.mimetype === "application/pdf") {
        cb(null, true);
    } else {
        cb(new Error("File type not allowed!"), false);
    }
};

const upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    limits: {
        fileSize: 20 * 1024 * 1024, // 20MB limit
    },
});

router.post("/proposal", upload.single("document"), createOrUpdateProposal);
router.get("/proposal", upload.single("document"), getAllProposal);
router.get('/proposal/pagination', getPaginationProposal);
router.get('/proposal/:id_mahasiswa', getProposalByMahasiswaId);
router.patch("/proposal/:id", upload.single("document"), updateProposal);

module.exports = router;
