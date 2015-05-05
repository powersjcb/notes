require_relative 'questions_database'

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.find_by_user_id(user_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = (?) LIMIT 1

    SQL

    return nil if raw_data.empty?

    QuestionFollow.new(raw_data.first)
  end

  def self.find_by_question_id(question_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ? LIMIT 1

    SQL
    return nil if raw_data.empty?

    QuestionFollow.new(raw_data.first)
  end

  def self.followers_for_question_id(question_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      JOIN
        questions ON question_follows.question_id = questions.id
      WHERE
        questions.id = (?)
    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| User.new(row) }
  end

  def self.followed_questions_for_user_id(user_id)
    raw_data = QuestionsDatabase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      JOIN
        users ON question_follows.user_id = users.id
      WHERE
        users.id = (?)
    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| Question.new(row) }
  end

  def self.most_followed_questions(n)
    raw_data = QuestionsDatabase.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC LIMIT ?
    SQL

    return nil if raw_data.empty?
    p raw_data
    raw_data.map { |row| Question.new(row)}
  end


  def initialize(args = {})
    @user_id, @question_id = args["user_id"], args["question_id"]
  end
end


if __FILE__ == $0
  p QuestionFollow.find_by_user_id(1)
  p QuestionFollow.find_by_question_id(1)

end
