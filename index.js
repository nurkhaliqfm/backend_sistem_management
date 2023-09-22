const express = require("express");
const dotenv = require("dotenv");
const cookieParser = require("cookie-parser");
const db = require("./config/Database.js");
const Users = require("./models/UserModel.js");
const Mahasiswa = require("./models/MahasiswaModel.js");
const userRouter = require("./routes/users.js");
const mahasiswaRouter = require("./routes/mahasiswa.js");
dotenv.config();

const app = express();

(async () => {
    try {
        await db.authenticate();
        console.log("Database Connected");
        await Users.sync();
        await Mahasiswa.sync();
    } catch (error) {
        console.log(error);
    }
})();

app.use(cookieParser());
app.use(express.json());
app.use(userRouter);
app.use(mahasiswaRouter);


app.listen(5000, () => {
    console.log("Server up and running on port 5000");
});