const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const JadwalUjian = db.define(
    "jadwal_ujian",
    {
        id_mahasiswa: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        type: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        jadwal: {
            type: DataTypes.DATE,
            allowNull: false,
        }
    },
    {
        freezeTableName: true,
    }
);

JadwalUjian.associate = (models) => {
    JadwalUjian.belongsTo(models.Mahasiswa, {
        foreignKey: "id_mahasiswa",
        as: "mahasiswa",
    });
}

module.exports = JadwalUjian;
