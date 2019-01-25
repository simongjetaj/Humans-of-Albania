const mysql = require('mysql');

const db = mysql.createConnection(require("../config/db-keys"));

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL connected...');
});

module.exports = db;