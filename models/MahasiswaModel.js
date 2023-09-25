const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const Mahasiswa = db.define(
    "mahasiswa",
    {
        id_neosia: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_prodi: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_user: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        nama_mahasiswa: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        nim: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        angkatan: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        status: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        pembimbing: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        penguji: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        judul: {
            type: DataTypes.TEXT,
            allowNull: true,
        },
        mahasiswa_profile: {
            type: DataTypes.STRING,
        },
    },
    {
        freezeTableName: true,
    }
);

Mahasiswa.associate = (models) => {
    Mahasiswa.belongsTo(models.Users, {
        foreignKey: "id_user",
        as: "user",
    });
    Mahasiswa.belongsTo(models.Prodi, {
        foreignKey: "id_prodi",
        as: "prodi",
    });
    Mahasiswa.hasMany(PengajuanProposal, {
        foreignKey: "id_mahasiswa",
        as: "pengajuan_proposal",
    });
    Mahasiswa.hasMany(JadwalBimbingan, {
        foreignKey: "id_mahasiswa",
        as: "jadwal_bimbingan",
    });
    Mahasiswa.hasMany(models.JadwalUjian, {
        foreignKey: "id_mahasiswa",
        as: "jadwal_ujian",
    });
};

module.exports = Mahasiswa;

// Sebuah mahasiswa hanya dapat terdaftar di satu prodi(relasi banyak ke satu)

// Setiap mahasiswa dapat memiliki banyak pengajuan_proposal, 