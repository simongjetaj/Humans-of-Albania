const express = require("express"),
  moment = require("moment"),
  router = express.Router();

const db = require('../db/db');

router.get('/', (req, res) => {
  // console.log(req.user, req.isAuthenticated()); // returns users id and username {user_id: 45, username: 'x'} or undefined and true or false

  if (req.query.search) {
    const sql = 'SELECT s.id, s.title, s.story, u.username, s.created_at FROM stories s INNER JOIN users u ON s.user_id = u.id WHERE (s.title LIKE ? OR s.story LIKE ? OR u.username LIKE ?)';
    db.query(sql, [`%${req.query.search}%`, `%${req.query.search}%`, `%${req.query.search}%`], (err, searchedStories) => {
      if (err) throw err;
      res.json(searchedStories);
    });
  } else {
    const options = {
      sql: 'SELECT stories.id, stories.title, stories.story, users.username, stories.created_at FROM stories INNER JOIN users ON stories.user_id = users.id',
      nestTables: true
    };
    db.query(options, (err, results, fields) => {
      // console.log(results);
      if (err) throw err;
      res.render('stories', {
        results: results,
        moment: moment,
        page: 'stories'
      });
    });

  }
});

router.post('/', (req, res) => {
  const formData = {
    user_id: parseInt(req.body.user_id),
    title: req.body.title,
    story: req.body.story
  }
  const sql = 'INSERT INTO stories SET ?';
  db.query(sql, formData, (err, results, fields) => {
    if (err) {
      throw err;
    } else {
      const sql2 = 'SELECT stories.id AS storyId, stories.title, stories.story, users.username, stories.created_at FROM stories INNER JOIN users ON stories.user_id = users.id WHERE stories.id = ?'
      db.query(sql2, [results.insertId], (err, newStory) => {
        if (err) throw err;
        res.json(newStory);
      });
    }
  });
});

router.get('/:id', (req, res) => {
  const sql = `SELECT s.id AS storyId, s.title, s.story, u.id AS userId, u.username, s.created_at FROM stories AS s INNER JOIN users AS u ON s.user_id = u.id WHERE s.id = ?`;
  db.query(sql, [req.params.id], (err, foundedStory) => {
    if (err || foundedStory.length === 0) res.redirect('/stories');

    const sql2 = `SELECT c.id, 
                    c.username,
                    c.comment
                    FROM stories s 
                  INNER JOIN comments c ON s.id = c.post_id
                  WHERE s.id = ?`;
    db.query(sql2, [req.params.id], (err, foundedComments) => {
      if (err) throw err;
      res.render('stories/show', {
        story: foundedStory,
        comments: foundedComments,
        page: 'story'
      });
    });
  });
});

router.put('/:id', isLoggedIn, (req, res) => {
  const formData = {
    title: req.body.title,
    story: req.body.story
  }

  const sql = 'UPDATE stories SET ? WHERE id = ?';
  db.query(sql, [formData, req.params.id], (err, results, fields) => {
    if (err) {
      throw err;
    }
  });

  const sql2 = 'SELECT title, story FROM stories WHERE id = ?';
  db.query(sql2, [req.params.id], (err, editedStory) => {
    if (err) throw err;
    res.json(editedStory);
  });
});

router.delete('/:id', isLoggedIn, (req, res) => {
  const sql = `DELETE FROM stories WHERE id = ?`;
  db.query(sql, [req.params.id], (err, foundedStory) => {
    if (err) {
      throw err;
    }
    res.json(foundedStory);
  });
});

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) return next();
  res.redirect('/login');
}

module.exports = router;