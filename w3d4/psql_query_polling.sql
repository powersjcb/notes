SELECT
  COUNT(*)
FROM
  questions
INNER JOIN
  answer_choices ON questions.id = answer_choices.question_id
INNER JOIN
  responses ON answer_choices.id = responses.answer_choice_id
WHERE
  questions.id = 20
