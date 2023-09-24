const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const PengajuanProposal = db.define(
  "pengajuan_proposal",
  {
    id_mahasiswa: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    judul: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    dosen_pembimbing: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    dosen_penguji: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    document: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
  }
);

PengajuanProposal.associate = () => {
  PengajuanProposal.belongsTo(Mahasiswa, {
    foreignKey: "id_mahasiswa",
    as: "mahasiswa"
  });
};

module.exports = PengajuanProposal;

//  setiap pengajuan_proposal hanya dapat dimiliki oleh satu mahasiswa