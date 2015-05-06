SELECT * FROM questions JOIN question_likes ON questions.id = question_likes.question_id;
SELECT *, COUNT(*), COUNT(question_id) FROM questions LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id GROUP BY questions.user_id;


SELECT COUNT(*), COUNT(question_likes.question_id) FROM questions LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id WHERE question_likes.user_id = ? GROUP BY questions.id;





SELECT COUNT(*), COUNT(question_likes.question_id) FROM questions LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id WHERE question_likes.user_id = ?
