class Tweet < ActiveRecord::Base
  has_many :mentions
  has_many :mentioned_users, through: :mentions, source: :user
  belongs_to :user

  validates :content, :user, presence: true
end
