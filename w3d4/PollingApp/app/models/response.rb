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

  belongs_to(
    :poll,
    through: :question,
    source: :poll
  )

  belongs_to(
    :poll_author,
    through: :poll,
    source: :author
  )


  # private

  def

  end

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
