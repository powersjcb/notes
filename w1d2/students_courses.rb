require 'byebug'
# debugger
class Student
  attr_reader :first_name, :last_name
  attr_accessor :courses_assigned
  def initialize( options = {} )
    validate_inputs(options)
    @first_name = options[:first_name]
    @last_name  = options[:last_name]
    @courses_assigned = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def courses
    if courses_assigned.count == 0
      "No courses assigned yet"
    else
      @courses_assigned.map(&:course_name)
    end
  end

  def enroll(course)
    unless course.students.include?(self)
      course.add_student(self)
      @courses_assigned << course
      puts "Sucessfully enrolled in #{course.course_name}!"
    end
    puts "Can't enroll twice"
  end

  def course_load
    # do at create or on call?
  end

  def validate_inputs(options)
    if options[:first_name].nil? | options[:last_name].nil?
      throw "Bad inputs"
    end
  end
end

class Course
  attr_accessor :course_name, :department, :credits, :students
  def initialize( options = {})
    @course_name = options[:course_name]
    @department  = options[:department]
    @credits     = options[:credits]
    @students    = []

    @days        = options[:days]

    # days are like {mon: [0,1,1,0,0,0,0,0]}
  end

  def enrollment
    @students.map {|student| student.name}
  end

  #only called inside of student class(students register themselves)
  def add_student(student)
    @students << student
  end

end



jacob = Student.new(first_name: "Jacob", last_name: "Powers")
physics = Course.new(course_name: "Physics I",
                    department: "Physics",
                    credits: "4",
                    days: { mon: 1, wed: 1, fri: 1 }
                      )
physics2 = Course.new(course_name: "Physics II",
                    department: "Physics",
                    credits: "6",
                    days: { mon: 1, wed: 1, fri: 1 }
                      )


jacob.enroll(physics)

puts "Student tests:"
puts "Accepts and prints valid names"
p jacob.name == "Jacob Powers"
puts "Student adds courses to self"
p jacob.courses.include?(physics.course_name)
puts "Student adds self to course"
p physics.students.include?(jacob)

puts "Course tests:"
puts "Accepts valid inputs and prints course_name"
p physics.course_name == "Physics I"
# puts
# puts "Testing schedules"
# physics
