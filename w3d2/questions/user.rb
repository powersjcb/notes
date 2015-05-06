require_relative 'questions_database'

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = (?) LIMIT 1

    SQL
    return nil if raw_data.empty?

    User.new(raw_data.first)
  end

  def self.find_by_name(fname, lname)
    raw_data = QuestionsDatabase.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = (?) AND lname = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| User.new(row) }
  end

  def initialize(args = {})
    @id, @fname, @lname = args["id"], args["fname"], args["lname"]
  end



  def authored_questions
    Question.find_by_user_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def average_karma
    raw_data = QuestionsDatabase.execute(<<-SQL, @id)
      SELECT
        COALESCE( CAST(COUNT(DISTINCT(questions.id)) AS FLOAT)/COUNT(*), 0)
          AS avg_karma
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.user_id = ?;
    SQL

    raw_data[0]["avg_karma"]
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

end
