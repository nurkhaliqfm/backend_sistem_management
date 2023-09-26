const path = require('path');

const getDocument = async (req, res) => {
    const imagePath = path.join(__dirname, `../assets/${req.params.fileName}`)
    res.sendFile(imagePath)
}

module.exports = {
    getDocument
}