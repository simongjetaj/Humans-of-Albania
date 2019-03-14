const express = require("express"),
  moment = require("moment"),
  multer = require("multer"),
  path = require("path"),
  normalize = require('normalize-path'),
  fs = require('fs'),
  router = express.Router();

const db = require("../db/db");

const {
  isLoggedIn
} = require("../config/auth");

// Set The Storage Engine
const storage = multer.diskStorage({
  destination: './public/storyImageUploads/',
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
});

// Init Upload
const upload = multer({
  storage,
  limits: {
    fileSize: 1000000
  },
  fileFilter: (req, file, cb) => {
    checkFileType(file, cb);
  }
}).single('image');

function checkFileType(file, cb) {
  const filetypes = /jpeg|jpg|png|gif/;
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  const mimetype = filetypes.test(file.mimetype);

  if (mimetype && extname) {
    return cb(null, true);
  } else {
    cb('Please, choose only images!');
  }
}

router.get("/", (req, res) => {
  // console.info(req.user, req.isAuthenticated()); // returns users id and username {user_id: 45, username: 'x'} or undefined and true or false

  if (req.query.search) {
    const sql =
      "SELECT s.id, s.title, s.story, s.image, u.username, s.created_at FROM stories s INNER JOIN users u ON s.user_id = u.id WHERE (s.title LIKE ? OR s.story LIKE ? OR u.username LIKE ?)";
    db.query(
      sql,
      [
        `%${req.query.search}%`,
        `%${req.query.search}%`,
        `%${req.query.search}%`
      ],
      (err, searchedStories) => {
        if (err) throw err;
        res.json(searchedStories);
      }
    );
  } else {
    const options = {
      sql: "SELECT stories.id, stories.title, stories.story, stories.image, users.username, stories.created_at FROM stories INNER JOIN users ON stories.user_id = users.id ORDER BY stories.created_at DESC",
      nestTables: true
    };
    db.query(options, (err, results, fields) => {
      // console.log(results);
      if (err) throw err;
      res.render("stories", {
        results,
        moment,
        displaySearchForm: true
      });
    });
  }
});

router.post("/", isLoggedIn, (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.statusMessage = err;
      res.status(409).end();
    } else {
      let formData = {
        user_id: parseInt(req.body.user_id),
        title: req.body.title,
        story: req.body.story
      };

      if (req.file != undefined) {
        formData.image = normalize(req.file.path);
      }

      const sql = "INSERT INTO stories SET ?";
      db.query(sql, formData, (err, results, fields) => {
        if (err) {
          throw err;
        } else {
          const sql2 =
            "SELECT stories.id AS storyId, stories.title, stories.story, stories.image, users.username, stories.created_at FROM stories INNER JOIN users ON stories.user_id = users.id WHERE stories.id = ?";
          db.query(sql2, [results.insertId], (err, newStory) => {
            if (err) throw err;
            res.json(newStory);
          });
        }
      });
    }
  });
});

router.get("/:id", isLoggedIn, (req, res) => {
  const sql = `SELECT s.id AS storyId, s.title, s.story, s.image, u.id AS userId, u.username, s.created_at FROM stories AS s INNER JOIN users AS u ON s.user_id = u.id WHERE s.id = ?`;
  db.query(sql, [req.params.id], (err, foundedStory) => {
    if (err || foundedStory.length === 0) res.redirect("/stories");

    const sql2 = `SELECT c.id, 
                    c.username,
                    c.comment
                    FROM stories s 
                  INNER JOIN comments c ON s.id = c.post_id
                  WHERE s.id = ?`;
    db.query(sql2, [req.params.id], (err, foundedComments) => {
      if (err) throw err;
      res.render("stories/show", {
        story: foundedStory,
        comments: foundedComments
      });
    });
  });
});

router.put("/:id", isLoggedIn, (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.statusMessage = err;
      res.status(409).end();
    } else {
      let formData = {
        user_id: parseInt(req.body.user_id),
        title: req.body.title,
        story: req.body.story
      };

      if (req.file != undefined) {
        formData.image = normalize(req.file.path);
      }
      const sql = "UPDATE stories SET ? WHERE id = ?";
      db.query(sql, [formData, req.params.id], (err, results, fields) => {
        if (err) {
          throw err;
        }
      });

      const sql2 = "SELECT title, story, image FROM stories WHERE id = ?";
      db.query(sql2, [req.params.id], (err, editedStory) => {
        if (err) throw err;
        res.json(editedStory);
      });
    }
  });
});

router.delete("/:id", isLoggedIn, (req, res) => {
  if (req.body.storyImagePath) {
    fs.unlink(req.body.storyImagePath, (err) => {
      if (err) {
        res.statusMessage = err;
        res.status(500).end();
      }
    });
  }
  const sql = `DELETE FROM stories WHERE id = ?`;
  db.query(sql, [req.params.id], (err, foundedStory) => {
    if (err) {
      throw err;
    }
    res.json(foundedStory);
  });
});

module.exports = router;