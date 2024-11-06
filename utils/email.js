const nodemailer = require('nodemailer');
const cds = require('@sap/cds');

//Estos valores los proporciona mailtrap una vez que registras te genera estos datos
var oTransport = nodemailer.createTransport({
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_PORT,
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

async function sendEmail(data){
    //console.log(data);
    const {ID, firtName, surname, token, contact, statu_code } = data;
    
};

module.exports = {
    sendEmail
};