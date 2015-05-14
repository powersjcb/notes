class UserSession < ActiveRecord::Base
  validates :user_id, :session_token, presence: true
  belongs_to :user

  def self.create_new_token(user)
    s_token = SecureRandom::urlsafe_base64(16)
    UserSession.create(user_id: user.id, session_token: s_token)
    return s_token
  end


end
