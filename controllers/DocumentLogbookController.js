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
    const { id } = req.params;

    try {
        const documentLogbookData = await DocumentLogbook.findOne({ where: { id: id } });

        if (!documentLogbookData) {
            return res.status(404).json({ message: "Document logbook not found" });
        }
        const formattedResponse = {
            content: {
                text: documentLogbookData.annotation_content
            }
        }

        res.json(formattedResponse);
    } catch (error) {
        console.error("Error getting document logbook by ID:", error);
        res.status(500).json({ message: "Error getting document logbook" });
    }
};

module.exports = {
    createDocumentLogbook,
    getDocumentLogbookById
};
