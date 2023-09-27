const PengajuanProposal = require("../models/PengajuanProposalModel.js");
const fs = require("fs");
const path = require("path");

const createProposal = async (req, res) => {
    const proposalData = req.body;
    console.log(req.file);

    try {
        await PengajuanProposal.create({
            judul: proposalData.judul,
            dosen_pembimbing: proposalData.dosen_pembimbing,
            dosen_penguji: proposalData.dosen_penguji,
            document: req.file.filename,
            status: proposalData.status,
            id_mahasiswa: proposalData.id_mahasiswa,
        });
        res.json("success");
    } catch (error) {
        console.error("Error creating proposal:", error);
        res.status(50).json("Error creating proposal");
    };
};

const getAllProposal = async (req, res) => {
    try {
        const pengajuanProposalData = await PengajuanProposal.findAll();
        res.json(pengajuanProposalData);
    } catch (error) {
        console.error("Kesalahan saat mengambil semua pengajuan proposal:", error);
        res.status(500).json("Kesalahan saat mengambil semua pengajuan proposal");
    }
};

const getProposalByMahasiswaId = async (req, res) => {
    const { id_mahasiswa } = req.params;

    try {
        const pengajuanProposalData = await PengajuanProposal.findOne({
            where: { id_mahasiswa: id_mahasiswa },
        });
        if (!pengajuanProposalData) {
            return res.status(404).json({ error: "Dosen not found" });
        }
        res.json(pengajuanProposalData);
    } catch (error) {
        console.error("Error retrieving proposal by user id mahasiswa:", error);
        res.status(500).json("Error retrieving proposal");
    }
};

const getPaginationProposal = async (req, res) => {
    const { page } = req.query;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 10;
    const startIndex = (pageNumber - 1) * pageSize;

    try {
        const totalCount = await PengajuanProposal.count();

        const pengajuanProposalData = await PengajuanProposal.findAll({
            offset: startIndex,
            limit: pageSize,
        });

        res.json({
            item: pengajuanProposalData,
            page: pageNumber,
            per_page: pageSize,
            totalItems: totalCount,
            totalPages: Math.ceil(totalCount / pageSize),
        });
    } catch (error) {
        console.error("Error retrieving paginated pengajuan proposal:", error);
        res.status(500).json("Error retrieving paginated pengajuan proposal");
    }
};

const updateProposal = async (req, res) => {
    const proposalData = req.body;
    const proposalId = req.params.id;

    try {
        const existingProposal = await PengajuanProposal.findByPk(proposalId);

        if (!existingProposal) {
            return res.status(404).json("Proposal not found");
        }

        if (req.file) {
            proposalData.document = req.file.filename;
        }

        await PengajuanProposal.update(proposalData, {
            where: {
                id: proposalId,
            },
        });

        res.json("Proposal updated successfully");
    } catch (error) {
        console.error("Error updating proposal:", error);
        res.status(500).json("Error updating proposal");
    }
};

module.exports = {
    createProposal,
    getAllProposal,
    getProposalByMahasiswaId,
    getPaginationProposal,
    updateProposal,
};
