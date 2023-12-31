const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const DocumentLogbook = db.define(
    "document_logbook",
    {
        id_document: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_mahasiswa: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_dosen: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_jadwal_bimbingan: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        annotation_type: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        annotation_content: {
            type: DataTypes.TEXT('long'),
            allowNull: true,
        },
        annotation_page: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        annotation_bounding: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        annotation_rect: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        annotation_comment: {
            type: DataTypes.TEXT('long'),
            allowNull: true,
        },
    },
    {
        freezeTableName: true,
    }
);
DocumentLogbook.associate = (models) => {
    DocumentLogbook.belongsTo(models.Mahasiswa, {
        foreignKey: "id_mahasiswa",
        as: "mahasiswa",
    });
    DocumentLogbook.belongsTo(models.Dosen, {
        foreignKey: 'id_dosen',
        as: 'dosen',
    });
    DocumentLogbook.belongsTo(models.JadwalBimbingan, {
        foreignKey: "id_jadwal_bimbingan",
        as: "jadwal_bimbingan"
    });

};


module.exports = DocumentLogbook;