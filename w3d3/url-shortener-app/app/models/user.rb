class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, allow_blank: false
end
