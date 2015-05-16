

10.times do
  User.create(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password
  )
end


5.times do |i|
  user = User.find(i+1)
  description = Faker::Hacker.say_something_smart
  title = Faker::Hacker.send([:noun, :adjective].sample).capitalize

  Sub.create(
    moderator: user,
    title: title,
    description: description)
end


Sub.all.each do |sub|
  User.all.each do |user|

    #make posts
    5.times do
      title = Faker::Hacker.send([:noun, :adjective].sample).capitalize
      content = Faker::Hacker.say_something_smart
      url = ""
      url = Faker::Internet.url if rand(2) == 0

      Post.create(
        title: title,
        url: url,
        content: content,
        sub: sub,
        author: user)

    end
  end
end

Sub.all.each do |sub|
  User.all.each do |user|
    sub.posts.each do |post|
      content = Faker::Hacker.say_something_smart
      Comment.create(
        content: content,
        commentable: post,
        user: user
      )
    end
  end
end
