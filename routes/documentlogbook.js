const express = require("express");
const {
    createDocumentLogbook,
    getDocumentLogbookById
} = require("../controllers/DocumentLogbookController.js");

const router = express.Router();

router.post("/document-logbook", createDocumentLogbook)
router.get('/document-logbook/:id', getDocumentLogbookById);

module.exports = router