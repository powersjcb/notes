SELECT * FROM questions JOIN question_follows ON questions.id = question_follows.question_id JOIN users ON question_follows.user_id = users.id WHERE users.id = (?);
