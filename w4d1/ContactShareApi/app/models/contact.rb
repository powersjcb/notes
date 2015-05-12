# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: true

  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :contact_shares, dependent: :destroy
  has_many(
    :solicitors,
    through: :contact_shares,
    source: :user
  )
end
