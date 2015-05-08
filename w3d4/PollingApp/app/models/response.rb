# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_poll_author


  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  has_one(
    :poll,
    through: :question,
    source: :poll
  )

  has_one(
    :poll_author,
    through: :poll,
    source: :author
  )


  # private

  def respondent_is_not_poll_author
     # The 3-query slow way:
     # poll_author_id = self.answer_choice.question.poll.author_id

     # 1-query; joins two extra tables.
     poll_author_id = Poll
       .joins(questions: :answer_choices)
       .where("answer_choices.id = ?", self.answer_choice_id)
       .pluck("polls.author_id")
       .first

     if poll_author_id == self.user_id
       errors[:user_id] << "cannot be poll author"
     end
   end

  # def repondent_did_not_create_question
  #   if !self.user_id.nil? && user_id == poll_author.id
  #     errors[:base] << "You can't respond to your own poll"
  #   end
  # end

  def respondent_has_not_already_answered_question
    if sibling_responses.where('user_id != ?', self.user_id).exists?
      errors[:question] << "You have already answered that question"
    end
  end

  def sibling_responses
    self.question
      .responses
      .where('responses.id != ? OR ? ', self.id, self.id.nil?)
  end
end
