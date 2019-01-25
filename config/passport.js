const LocalStrategy = require("passport-local").Strategy,
  bcrypt = require("bcrypt");

const db = require("../db/db");

module.exports = function (passport) {
  passport.use(
    new LocalStrategy((username, password, done) => {
      db.query(
        "SELECT id, username, email, password FROM users WHERE username = ?",
        [username],
        (err, user) => {
          if (err) done(err);
          if (user.length === 0) {
            done(null, false, {
              message: "The username or password you entered is incorrect!"
            });
          } else {
            const hash = user[0].password.toString();

            bcrypt.compare(password, hash, (err, res) => {
              if (res === true) {
                return done(null, {
                  user_id: user[0].id,
                  username: user[0].username
                }); // username and password should match the names of the form input fields and they should be named username & password
              } else {
                return done(null, false, {
                  message: "The username or password you entered is incorrect!"
                });
              }
            });
          }
        }
      );
    })
  );
};