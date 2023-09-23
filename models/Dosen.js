const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const Dosen = db.define(
    "dosen",
    {
        id_prodi: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_user: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        nama_dosen: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        nip: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        dosen_type: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        dosen_profile: {
            type: DataTypes.STRING,
            allowNull: true
        }
    },
    {
        freezeTableName: true,
    }
);

module.exports = Dosen;
