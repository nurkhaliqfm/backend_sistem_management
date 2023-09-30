const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const JadwalBimbingan = db.define(
    "jadwal_bimbingan",
    {
        id_mahasiswa: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_dosen: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        jadwal: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        document_name: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        status: {
            type: DataTypes.INTEGER,
            allowNull: false,
        }
    },
    {
        freezeTableName: true,
    }
);

JadwalBimbingan.associate = (models) => {
    JadwalBimbingan.belongsTo(models.Mahasiswa, {
        foreignKey: "id_mahasiswa",
        as: "mahasiswa",
    });
    JadwalBimbingan.belongsTo(models.Dosen, {
        foreignKey: "id_dosen",
        as: "dosen",
    });
    JadwalBimbingan.hasOne(models.DocumentLogbook, {
        foreignKey: "id_jadwal_bimbingan",
        as: "document_logbook"
    });
};


module.exports = JadwalBimbingan;

