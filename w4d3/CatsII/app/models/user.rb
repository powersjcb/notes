class User < ActiveRecord::Base

  validates :user_name, :password_digest, presence: true
  #after_initialize :make_session_token

  has_many :cats
  has_many :cat_rental_requests
  has_many(
    :session_tokens,
    class_name: "UserSession"
  )

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    if user && user.is_password?(password)
      return user
    end
    nil
  end

end
