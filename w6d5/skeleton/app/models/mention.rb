class Mention < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  validates :tweet, :user, presence: true
  validates :user, uniqueness: { scope: :tweet }
end
