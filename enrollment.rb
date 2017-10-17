require 'date'

class Enrollment
  attr_reader :course
  def initialize(student, course)
    @student = student
    @course = course
    @timestamp = DateTime.now
  end

  def to_s
    "#{@student.first_name} #{@student.last_name} from #{@student.university} is enrolled in #{@course.course} at #{@timestamp}"
  end
end
