# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CATS = %w(breakfast earl curie markov gizmo kiki sally)

CATS.each do |cat|
  u = User.create!(username: cat, password: "#{cat}#{cat}")
end

MESSAGES = [
  "Ate some tuna",
  "Chased a string",
  "Bounced a ball",
  "Took a photo of a sandwich",
  "Took a long nap",
  "Jumped on some piano keys",
  "Is that a mouse?",
  "Scratched a human",
  "Jumped to the top of the shelf!",
  "Do cats know how to tweet? YES, we do.",
  "Set world napping record",
  "xvyadfoiuasdfnasfdn"
]

User.all.each do |user|
  40.times do
    msg = MESSAGES.sample
    Tweet.create!(user_id: user.id, content: msg, created_at: rand(10.years).ago)
  end
end
