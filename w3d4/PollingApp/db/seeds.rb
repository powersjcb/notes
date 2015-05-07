# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


20.times do |i|
  User.find_or_create_by({:email => "email#{i}@example.com"})
end

3.times do |i|
  Poll.find_or_create_by({:author => User.all[i+1], :title => "Title #{i}"})

  20.times do |j|
    Question.find_or_create_by(
      body: "Question: What is #{i} + #{j}?",
      poll_id: i+1
    )
    4.times do |k|
      AnswerChoice.find_or_create_by(
        question_id: j+1,
        body: "#{i+j-k}"
      )

    end

  end

end

User.all.each do |user|
  Question.all.drop(10).each do |question|
    unless question.answer_choices.empty?
      Response.find_or_create_by({user_id: user.id, answer_choice_id: question.answer_choices.sample.id})
    end
  end
end


# Response.new(user_id: 1, answer_choice_id: 1 )
# b = Response.new(user_id: 1, answer_choice_id: 60 )  # should be invalid
