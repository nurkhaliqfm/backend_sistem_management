const path = require('path');

const getDocument = async (req, res) => {
    const imagePath = path.join(__dirname, `../assets/proposal${req.params.fileName}`)
    res.sendFile(imagePath)
}

module.exports = {
    getDocument
}