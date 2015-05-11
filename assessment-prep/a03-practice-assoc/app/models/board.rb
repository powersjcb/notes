# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Board < ActiveRecord::Base
  belongs_to :company
  has_many :memberships, class_name: "BoardMembership"
  has_many :members, through: :memberships, source: :member
  has_one :exchange, through: :company, source: :exchange
end
