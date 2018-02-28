const express = require('express'),
  ejs = require('ejs'),
  mysql = require('mysql'),
  bodyParser = require('body-parser'),
  session = require('express-session'),
  passport = require('passport'),
  MySQLStore = require('express-mysql-session')(session), // we use it because nodemon get rids of our user session everytime it starts, so we save their session and store them into a table
  LocalStrategy = require('passport-local').Strategy,
  bcrypt = require('bcrypt');
  
  db = require('./db/db'), 
  path = require('path'),
  indexRoutes = require('./routes/index'),
  storiesRoutes = require('./routes/stories'),
  commentRoutes = require('./routes/comments'),
  app = express();

app.set('view engine', 'ejs');
app.use('/public', express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const options = {
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'humans'
};

const sessionStore = new MySQLStore(options);

app.use(session({
  secret: 'dsadafamfcalfancajnf',
  store: sessionStore,
  resave: false,
  saveUninitialized: false,
}));

app.use(passport.initialize());
app.use(passport.session());

app.use(function(req, res, next) {
  res.locals.currentUser = req.user; // now currentUser is availavable for use in all of our view files via the variable named currentUser
  next();
});

passport.use(new LocalStrategy(
  function(username, password, done) {
    db.query('SELECT id, username, email, password FROM users WHERE username = ?', [username], (err, user) => {
      if(err) done(err);
      if(user.length === 0) {
        done(null, false);
      } else {
        const hash = user[0].password.toString();
        
        bcrypt.compare(password, hash, function(err, res) {
          if(res === true) {
          
            return done(null, { user_id: user[0].id, username: user[0].username }); // username and password should match the names of the form input fields and they should be named username & password
          } else {
            return done(null, false);
          }
        });
      }
    });
  }
));

// Requiring routes
app.use(indexRoutes);
app.use('/stories', storiesRoutes);
app.use('/stories/:id/comments', commentRoutes);

app.listen(3000, () => console.log("Simon's Server started..."));