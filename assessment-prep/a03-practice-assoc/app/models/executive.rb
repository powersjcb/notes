# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base
  belongs_to :board_membership

  has_many(
    :board_memberships,
    class_name: "BoardMembership",
    foreign_key: :executive_id,
    primary_key: :id
  )

  has_many(
    :memberships,
    through: :board_memberships,
    source: :board
  )
end
