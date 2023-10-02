const path = require('path');

const getBimbingan = async (req, res) => {
    const imagePath = path.join(__dirname, `../assets/bimbingan/${req.params.fileName}`)
    res.sendFile(imagePath)
}

module.exports = {
    getBimbingan
}