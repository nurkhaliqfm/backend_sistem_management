const express = require("express");
const {
    createJadwalBimbingan,
    updateJadwalBimbingan,
    getAllJadwalBimbingan,
    getJadwalBimbinganPending,
    getPaginationJadwalBimbingan,
} = require("../controllers/JadwalBimbinganController.js");

const router = express.Router();

const multer = require("multer");
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "assets/bimbingan");
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

router.post("/jadwal-bimbingan", upload.single("document_name"), createJadwalBimbingan);
router.get("/jadwal-bimbingan", getAllJadwalBimbingan);
router.get('/jadwal-bimbingan/pending/:id_mahasiswa', getJadwalBimbinganPending);
router.get("/jadwal-bimbingan/pagination/:id_mahasiswa", getPaginationJadwalBimbingan);
router.patch("/jadwal-bimbingan/:id", upload.single("document_name"), updateJadwalBimbingan);

module.exports = router;
