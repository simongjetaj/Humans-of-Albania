require("dotenv").config();
const express = require("express"),
  app = express(),
  session = require("express-session"),
  passport = require("passport"),
  MySQLStore = require("express-mysql-session")(session), // we use it because nodemon get rids of our user session everytime it starts, so we save their session and store them into a table
  path = require("path"),
  flash = require("connect-flash"),
  randomString = require("randomstring");

const indexRoutes = require("./routes/index"),
  storiesRoutes = require("./routes/stories"),
  commentRoutes = require("./routes/comments");

const port = parseInt(process.env.PORT, 10) || 3000;

require("./config/passport")(passport);

app.set("view engine", "ejs");
app.use("/public", express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false })); // bodyParser
app.use(flash());

const options = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME
};

const sessionStore = new MySQLStore(options);

app.use(
  session({
    secret: randomString.generate(),
    store: sessionStore,
    resave: false,
    saveUninitialized: false
  })
);

app.use(passport.initialize());
app.use(passport.session());

app.use((req, res, next) => {
  res.locals.currentUser = req.user; // now currentUser is availavable for use in all of our view files via the variable named currentUser
  res.locals.error = req.flash("error"); // passport error msgs
  res.locals.errorMsg = req.flash("errorMsg");
  next();
});

// Requiring routes
app.use(indexRoutes);
app.use("/stories", storiesRoutes);
app.use("/stories/:id/comments", commentRoutes);

app.get("*", (req, res) => {
  res.render("404");
});

app.listen(port, () =>
  console.log(`Simon's Server started on port ${port}...`)
);
