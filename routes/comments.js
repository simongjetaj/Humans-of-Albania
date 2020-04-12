const express = require('express'),
  router = express.Router();

const db = require('../db/db');

const { isLoggedIn } = require('../config/auth');

router.post('/', isLoggedIn, (req, res) => {
  const commentData = {
    post_id: req.body.post_id,
    username: req.body.username,
    comment: req.body.comment,
  };

  const sql = 'INSERT INTO comments SET ?';
  db.query(sql, [commentData], (err, results, fields) => {
    if (err) {
      throw err;
    }
    const sql2 =
      'SELECT s.id AS storyId, c.id AS commentId, c.username, c.comment FROM comments c INNER JOIN stories s ON s.id = c.post_id WHERE c.id = ?';
    db.query(sql2, [results.insertId], (err, newComment) => {
      if (err) throw err;
      res.json(newComment);
    });
  });
});

router.put('/:comment_id', isLoggedIn, (req, res) => {
  const comment = {
    comment: req.body.editedComment,
  };

  const sql = 'UPDATE comments SET ? WHERE id = ?';
  db.query(sql, [comment, req.params.comment_id], (err, results, fields) => {
    if (err) throw err;
  });

  const sql2 = 'SELECT comment FROM comments WHERE id = ?';
  db.query(sql2, [req.params.comment_id], (err, editedComment) => {
    if (err) throw err;
    res.json(editedComment);
  });
});

router.delete('/:comment_id', isLoggedIn, (req, res) => {
  const sql = 'DELETE FROM comments WHERE id = ?';
  db.query(sql, [req.params.comment_id], (err, results, fields) => {
    if (err) throw err;
    res.json(results);
  });
});

module.exports = router;
