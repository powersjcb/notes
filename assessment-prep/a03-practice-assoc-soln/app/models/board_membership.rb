class BoardMembership < ActiveRecord::Base
  belongs_to(
    :board,
    primary_key: :id,
    foreign_key: :board_id,
    class_name: "Board"
  )

  belongs_to(
    :member,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: "Executive"
  )
end
