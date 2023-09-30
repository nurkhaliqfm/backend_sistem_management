const express = require("express");
const dotenv = require("dotenv");
const cookieParser = require("cookie-parser");
const db = require("./config/Database.js");
const cors = require('cors');

// const Users = require("./models/UserModel.js");
// const Dosen = require("./models/DosenModel.js")
// const Mahasiswa = require("./models/MahasiswaModel.js");
// const PengajuanProposal = require("./models/PengajuanProposalModel.js");
// const JadwalBimbingan = require("./models/JadwalBimbinganModel.js");
// const Notification = require('./models/Notification.js');
// const JadwalUjian = require("./models/JadwalUjianModel.js");
// const DocumentLogbook = require("./models/DocumentLogbookModel.js");

const userRouter = require("./routes/users.js");
const mahasiswaRouter = require("./routes/mahasiswa.js");
const proposalRouter = require("./routes/pengajuanproposal.js");
const dosenRouter = require('./routes/dosen.js');
const jadwalBimbinganRouter = require('./routes/jadwalbimbingan.js');
const notificationRouter = require('./routes/notification.js');
const jadwalUjianRouter = require('./routes/jadwalujian.js');
const getDocument = require('./routes/getDocument.js');
dotenv.config();

const app = express();

(async () => {
    try {
        await db.authenticate();
        console.log("Database Connected");
        // await Users.sync();
        // await Dosen.sync();
        // await Mahasiswa.sync();
        // await PengajuanProposal.sync();
        // await JadwalBimbingan.sync();
        // await Notification.sync();
        // await JadwalUjian.sync();
        // await DocumentLogbook.sync();
    } catch (error) {
        console.log(error);
    }
})();

app.use(cookieParser());
app.use(express.json());
app.use(cors());

app.use(userRouter);
app.use(mahasiswaRouter);
app.use(proposalRouter);
app.use(dosenRouter);
app.use(jadwalBimbinganRouter);
app.use(notificationRouter);
app.use(jadwalUjianRouter);


app.use(getDocument);


app.listen(5000, () => {
    console.log("Server up and running on port 5000");
});