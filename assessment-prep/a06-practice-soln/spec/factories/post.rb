FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words(4).join(" ") }
    body  { Faker::Lorem.paragraph(2) }
    sequence :order do |n|
      n
    end
  end
end
