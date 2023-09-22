const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const Mahasiswa = db.define(
    "mahasiswa",
    {
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
    Mahasiswa.belongsTo(models.UserModel, {
        foreignKey: "id_user",
        as: "user",
    });
};

module.exports = Mahasiswa;
