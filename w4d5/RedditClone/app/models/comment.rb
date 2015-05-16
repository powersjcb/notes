# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#

class Comment < ActiveRecord::Base

  include Commentable

  validates(
    :user_id,
    uniqueness: {
      scope: [:commentable_id, :commentable_type]
    })

  belongs_to :user
  belongs_to :commentable, polymorphic: true


end
