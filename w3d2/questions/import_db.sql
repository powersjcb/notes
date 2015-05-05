DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;



CREATE TABLE users (
  id integer primary key AUTOINCREMENT NOT NULL,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id integer primary key AUTOINCREMENT NOT NULL,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  user_id integer references users(id) NOT NULL
);

CREATE TABLE question_follows (
  user_id integer references users(id) NOT NULL,
  question_id integer references questions(id) NOT NULL
);

CREATE TABLE replies (
  id integer primary key AUTOINCREMENT NOT NULL,
  body TEXT NOT NULL,
  user_id integer references users(id) NOT NULL,
  question_id integer references questions(id) NOT NULL,
  parent_reply_id integer references replies(id)
);


CREATE TABLE question_likes (
  id integer primary key AUTOINCREMENT NOT NULL,
  user_id integer references users(id) NOT NULL,
  question_id integer references questions(id) NOT NULL
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Jacob', 'Powers'),
  ('Alex', 'Chebotarev'),
  ('Test', 'User');

INSERT INTO
  questions(title, body, user_id)
VALUES
  ('What?', 'Content of what', 1),
  ('Who?', 'Content of who', 2),
  ('How?', 'Content of how', 1);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (1, 2),
  (1, 3),
  (3, 3);


INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1, 2),
  (1, 3),
  (3, 3);

INSERT INTO
  replies(body, user_id, question_id, parent_reply_id)
VALUES
  ('Answer to what', 2, 1, NULL),
  ('Answer to how', 3, 3, NULL),
  ('Answer to who', 2, 2, NULL),
  ('Reply to reply', 2, 2, 3);
