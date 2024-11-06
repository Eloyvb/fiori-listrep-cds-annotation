function generateID() {
    return Math.random().toString(32).toString(2) + Date.now().toString(32);
}

module.exports = {
    generateID
}