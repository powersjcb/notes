class Exchange < ActiveRecord::Base
  has_many(
    :companies,
    primary_key: :id,
    foreign_key: :exchange_id,
    class_name: "Company"
  )
end
