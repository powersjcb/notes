class Courses
  def initialize( options = {})
    @course_name = options[:course_name]
    @department  = options[:department]
    @credits     = options[:credits]
    @students
    @days
    @credits
  end

  #only called inside of student class(students register themselves)
  def add_student(student)
    @student << student
  end

  def
end
