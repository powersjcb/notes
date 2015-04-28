require 'byebug'
class Employee
  attr_reader :salary, :boss, :name


  def initialize(options = {})
    @name = options["name"]
    @title = options["title"]
    @salary = options["salary"]
    @boss = options["boss"]
    add_employee unless @boss.nil?
  end

  def add_employee
    @boss.employees << self
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(options = {})
    @employees = []
    super(options)
  end

  def subordinates_salaries
    bonus_base = 0
    employees.each do |sub|
      bonus_base += sub.salary
      bonus_base += sub.subordinates_salaries if sub.is_a? Manager
    end

    bonus_base
  end

  def bonus(multiplier)
    raise "no subordinates" if @employees.empty?

    @bonus = multiplier * subordinates_salaries
  end
end

ned = Manager.new({'name' => 'Ned',
                   'title' => "Founder",
                   'salary' => 1_000_000 })

darren = Manager.new({'name' => 'Darren',
                      'title' => "TA Manager",
                      'salary' => 78_000,
                      'boss' => ned
                       })

shawna = Employee.new({'name' => 'Shawna',
                       'title' => "TA",
                       'salary' => 12_000,
                       'boss' => darren
                        })

david = Employee.new({'name' => 'Davod',
                       'title' => "TA",
                       'salary' => 10_000,
                       'boss' => darren
                        })


# p darren.boss
# p ned.boss
puts ned.bonus(5)
#
# p darren.boss
