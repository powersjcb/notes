require_relative 'questions_database'

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.find_by_user_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        user_id = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| QuestionLike.new(row) }
  end

  def self.find_by_question_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_id = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| QuestionLike.new(row) }
  end

  def self.likers_for_question_id(question_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      JOIN
        questions ON question_likes.question_id = questions.id
      WHERE
        questions.id = ?
    SQL

    return nil if raw_data.empty?

    raw_data.map { |row| User.new(row) }
  end

  def self.most_liked_questions(n)
    raw_data = QuestionsDatabase.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC LIMIT ?
    SQL

    raw_data.map { |row| Question.new(row) }
  end

  def self.num_likes_for_question_id(question_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL

    raw_data.first["COUNT(*)"]
  end

  def self.liked_questions_for_user_id(user_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      JOIN
        users ON question_likes.user_id = users.id
      WHERE
        users.id = ?
    SQL

    return nil if raw_data.empty?

    raw_data.map { |row| Question.new(row) }
  end

  def initialize(args = {})
    @user_id, @question_id = args["user_id"], args["question_id"]
  end
end


if __FILE__ == $0
  p QuestionLike.find_by_user_id(1)
  p QuestionLike.find_by_question_id(2)

end
