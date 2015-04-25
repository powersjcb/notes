# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create!(:title => "Post 1", :body => "Body 1")
Post.create!(:title => "Post 2", :body => "Body 2")
Post.create!(:title => "Post 3", :body => "Body 3")
Post.create!(:title => "Post 4", :body => "Body 4")
