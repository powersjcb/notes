# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  website       :string(255)
#  market_cap    :float
#  ticker_symbol :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  exchange_id   :integer
#

class Company < ActiveRecord::Base
  belongs_to(
    :exchange,
    class_name: "Exchange",
    foreign_key: :exchange_id,
    primary_key: :id
  )

    belongs_to(
    :watch_list_item,
    class_name: "WatchListItem",
    foreign_key: :company_id,
    primary_key: :id
    )


  has_many(
    :prices,
    class_name: "Price",
    foreign_key: :company_id,
    primary_key: :id
  )



end
