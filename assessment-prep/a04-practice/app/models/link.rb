class Link < ActiveRecord::Base
  validates :link, :user_id, presence: true

  belongs_to :user

end
