class Employee

  attr_reader :salary, :boss

  def initialize(options = {})
    @name   = options[:name]
    @title  = options[:title]
    @salary = options[:salary]
    @boss   = options[:boss]
  end

  def bonus(m)
    @salary * m
  end

end


class Manager < Employee

  def initialize(options = {})
    super
    @employees = options[:employees]
  end

  def bonus
  end
end
bob   = Manager.new({name: "Bob", title: "CEO", salary: 1_000_000})
ned   = Manager.new({name: "Ned", title: "Engineer Manager", salary: 205_000, manager: bob })
jacob = Employee.new({name: "Jacob", title: "Engineer", salary: 105_000, boss: ned})
# p bob.subordinates(bob)
