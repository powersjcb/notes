# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times { |i|  User.create!(username: "User #{i + 1}") }

5.times do |i|
  20.times do |j|
    Contact.create!(
      name: "contact #{i} #{j}",
      email: "email #{i} #{j}",
      user_id: i + 1
    )
  end
end

5.times do |i|
  5.times do |j|
    ContactShare.create!(
      contact_id: j + 1,
      user_id: i + 1,
    )
  end
end
