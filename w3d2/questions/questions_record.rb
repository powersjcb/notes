require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

if __FILE__ == $0
  # p User.find_by_id(1).authored_questions
  # p User.find_by_id(2).authored_replies
  #
  # p Question.find_by_user_id(1).first.author.id == 1
  # p Question.find_by_id(1).author
  #
  # p Reply.find_by_id(2).child_replies

  # p QuestionFollow.followers_for_question_id(3)
  # p QuestionFollow.followed_questions_for_user_id(1)
  # p Question.find_by_id(2).followers
  # p User.find_by_id(1).followed_questions
  # p QuestionFollow.most_followed_questions(2)
  #
  # p Question.most_followed(2)

  # p QuestionLike.likers_for_question_id(3)

  # p QuestionLike.num_likes_for_question_id(1)

  # p QuestionLike.liked_questions_for_user_id(2)

  # p QuestionLike.most_liked_questions(2)

  # p Question.most_liked(2)


  # p User.find_by_id(1).average_karma


a = User.new("lname" => "Johnson", "fname" => "Jack")
p a
p User.all
p a.save
p User.all
p a.lname = "Robert"
p a.save
p User.all

end
