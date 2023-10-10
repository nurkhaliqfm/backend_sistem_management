const DocumentLogbook = require("../models/DocumentLogbookModel.js");

const createDocumentLogbook = async (req, res) => {
    const documentLogbookData = req.body;

    try {
        await DocumentLogbook.create({
            annotation_type: documentLogbookData.annotation_type,
            annotation_content: documentLogbookData.annotation_content,
            annotation_page: documentLogbookData.annotation_page,
            annotation_bounding: documentLogbookData.annotation_bounding,
            annotation_rect: documentLogbookData.annotation_rect,
            annotation_comment: documentLogbookData.annotation_comment,
            id_mahasiswa: documentLogbookData.id_mahasiswa,
            id_dosen: documentLogbookData.id_dosen,
            id_jadwal_bimbingan: documentLogbookData.id_jadwal_bimbingan
        })
    } catch (error) {
        console.error("Error creating document logbook:", error);
        res.status(500).json("Error creating document logbook");
    }
}

const getDocumentLogbookById = async (req, res) => {

}

module.exports = {
    createDocumentLogbook,
}