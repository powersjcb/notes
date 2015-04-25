class Company < ActiveRecord::Base
  belongs_to(
    :exchange,
    primary_key: :id,
    foreign_key: :exchange_id,
    class_name: "Exchange"
  )

  has_many(
    :prices,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: "Price"
  )

  has_many(
    :watch_list_items,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: "WatchListItem"
  )

  has_many(
    :watch_lists,
    through: :watch_list_items,
    source: :watch_list
  )

  has_many(
    :watchers,
    through: :watch_lists,
    source: :user
  )

  has_one(
    :board,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: "Board"
  )
end
