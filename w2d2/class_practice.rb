# User class that has a name
class User
  attr_reader :first_name, :last_name
  def initialize(options = {})
    @first_name = options['first_name']
    @last_name  = options['last_name']
  end

  def name
    "#{first_name} #{last_name}"
  end
end

# Super user class has a comment to shut up linter
class SuperUser < User
  attr_reader :admin_key
  def initialize(options = {})
    # Super can be used in two ways: like shown with arguments, where it passes
    #   explicit arguments to the parent version of the same method, or
    #   implicitly with the inputs automatically passed to the parent.
    # This example should work both ways.
    super  # tested, yes works both ways.
    @admin_key = options['admin_key']
  end

  def ban_hammer(bad_user)
    bad_user.delete
  end
end


# Another example of using super where it is actually needed explicitly.
class Animal
  attr_reader :species
  def initialize(species)
    @species = species
  end
end

class Human < Animal
  attr_reader :name
  def initialize(name)
    super('Homo Sapiens')  # REQUIRED, MUST BE BEFORE ASSIGNMENT OF @NAME
    @name = name
  end
end
