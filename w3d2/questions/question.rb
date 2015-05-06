require_relative 'questions_database'

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = (?)
    SQL
    return nil if raw_data.empty?

    Question.new(raw_data.first)
  end

  def self.find_by_user_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| Question.new(row) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(args = {})
    @id, @title = args["id"], args["title"]
    @body, @user_id = args["body"], args["user_id"]
  end

  def author
    User.find_by_id(@user_id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

end
