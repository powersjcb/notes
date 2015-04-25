class Executive < ActiveRecord::Base
  has_many(
    :memberships,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: "BoardMembership"
  )

  has_many(
    :boards,
    through: :memberships,
    source: :board
  )
end
