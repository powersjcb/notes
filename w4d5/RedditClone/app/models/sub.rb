# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  has_many :posts
  default_scope { order(title: :asc) }

  belongs_to :moderator, class_name: "User", foreign_key: :moderator_id

  validates :title, :description, :moderator_id, presence: true
  validates :description, length: { maximum: 300 }
  validates :title, uniqueness: true

end
