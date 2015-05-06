require_relative 'questions_database'

class Reply
  attr_accessor :id, :user_id, :question_id, :body, :parent_reply_id

  def self.find_by_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = (?) LIMIT 1

    SQL
    return nil if raw_data.empty?

    Reply.new(raw_data.first)
  end

  def self.find_by_user_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| Reply.new(row) }
  end

  def self.find_by_question_id(id)
    raw_data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = (?)

    SQL
    return nil if raw_data.empty?

    raw_data.map { |row| Reply.new(row) }
  end

  def initialize(args = {})
    @id, @user_id = args["id"], args["user_id"]
    @question_id, @parent_reply_id = args["question_id"], args["parent_reply_id"]
    @body = args["body"]
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    raise "Object not saved" if @id.nil?
    raw_data = QuestionsDatabase.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = (?)

    SQL
    return nil if raw_data.empty?
    raw_data.map { |row| Reply.new(row) }
  end

end

if __FILE__ == $0
  p Reply.find_by_id(1)

end
