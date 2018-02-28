const mysql = require('mysql');

const db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'humans'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Mysql connected');
});

module.exports = db;