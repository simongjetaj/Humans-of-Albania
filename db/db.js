const mysql = require("mysql");

const db = mysql.createPool(require("../config/db-keys"));

db.on("connection", connection => {
  console.log("MySQL connected...");
  connection.on("error", err => {
    throw err;
  });
});

module.exports = db;
