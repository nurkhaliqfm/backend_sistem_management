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
    dosen_pemb: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    dosen_peng: {
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

export default PengajuanProposal;
