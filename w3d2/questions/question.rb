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

    Question.new(raw_data)
  end

  def initialize(args = {})
    @id, @title = args["id"], args["title"]
    @body, @user_id = args["body"], args["user_id"]
  end

end
