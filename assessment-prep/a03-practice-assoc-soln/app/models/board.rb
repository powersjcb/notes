class Board < ActiveRecord::Base
  belongs_to(
    :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: "Company"
  )

  has_many(
    :memberships,
    primary_key: :id,
    foreign_key: :board_id,
    class_name: "BoardMembership"
  )

  has_many(
    :members,
    through: :memberships,
    source: :member
  )

  has_one(
    :exchange,
    through: :company,
    source: :exchange
  )
end
