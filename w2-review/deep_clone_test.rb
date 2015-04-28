require 'deep_dive'
class User
  attr_reader :name
  include DeepDive
  def initialize(name,key)
    @name = name
    @key = key
  end

  def deep_dup
    
  end
end


a = User.new('Jacob', 'tester')
puts "id of starting object"
p a.object_id
p a.name.object_id
b = a.ddup
p b.object_id
p b.name.object_id
