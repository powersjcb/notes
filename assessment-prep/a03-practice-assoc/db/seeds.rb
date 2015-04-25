# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  nasdaq = Exchange.create(id: rand_id, name: "NASDAQ")

  goog = Company.create(
    id: rand_id,
    name: "Google",
    website: "google.com",
    market_cap: 4000,
    ticker_symbol: "GOOG",
    exchange_id: nasdaq.id
  )

  10.times do |x|
    Price.create(
      id: rand_id,
      company_id: goog.id,
      open: 1000 + x,
      high: 1010 + x,
      low: 990 + x,
      close: 1001 + x,
      price_date: Date.today + x
    )
  end

  ### SETUP BOARD
  larry = Executive.create(id: rand_id, name: "Larry Page")
  board = Board.create(id: rand_id, company_id: goog.id)
  BoardMembership.create(
    id: rand_id,
    member_id: larry.id,
    board_id: board.id
  )

  ### SETUP USER
  u = User.create(id: rand_id, username: "stevej", password: "password")
  wl = WatchList.create(id: rand_id, name: "big winners", user_id: u.id)
  wl_item = WatchListItem.create(
    id: rand_id,
    company_id: goog.id,
    start_date: Date.today + 1,
    end_date: Date.today + 4,
    watch_list_id: wl.id
  )
end
