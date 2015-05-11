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
  has_many :prices
  belongs_to :exchange
  has_one :board
  has_many :watch_list_items
  has_many :watch_lists, through: :watch_list_items, source: :watch_list
  has_many :watchers, through: :watch_lists, source: :user
end
