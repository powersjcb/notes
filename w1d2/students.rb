class Students
  def initialize( options = {} )
    @first_name = options[:first_name]
    @last_name  = options[:last_name]
    @courses
  end

  def name
    "#{first_name last_name}"
  end

  def courses
    @courses.map(&:course_name)
  end

  def enroll(course)
    if course.students.include?(self)
      course.add_student(self)
      @courses << course
      puts "Sucessfully enrolled in #{course.course_name}!"
    end
    puts "Can't enroll twice"
  end

  def course_load
    # do at create or on call?
  end
end
