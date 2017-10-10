class Course
  #attr_reader so the method can be called outside of the class later. course is passed as a key, adding :
  attr_reader :course
  def initialize(course:)
    @course = course
  end
end

class User
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class Student < User
  attr_reader :university #first_name and last_name already assigned to attr_reader in User class.
  def initialize(first_name:, last_name:, university:)
    super(first_name, last_name)
    @university = university
    @enrollments = []
  end

  def name
    [@first_name, @last_name].join(' ')
  end

  def enroll(course)
    enrollment = Enrollment.new(self, course) #self to differentiate between student 1 and 2
    @enrollments << enrollment
    enrollment
  end

  def enroll?(course)
    found = false
    @enrollments.each do |enrollment|
     if enrollment.course == course
       found = true
     end
    end
    found
  end
end

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


student1 = Student.new(first_name: 'John', last_name: 'Lee', university: 'UVA')
student2 = Student.new(first_name: 'Mary', last_name: 'G', university: 'Berkley')

course1 = Course.new(course: 'Product Management')
course2 = Course.new(course: 'Consulting')

#placing multiple values in an array:
#IS THIS NEEDED??? ENROLLMENTS ALREADY DEFINED IN CLASS STUDENT
enrollments = []
enrollments << student1.enroll(course1)
enrollments << student2.enroll(course2)

enrollments.each do |enrollment|
  puts enrollment.to_s
end

p student1.enroll?(course1) # true
p student2.enroll?(course2) # true
p student2.enroll?(course1) # false

#class Session
#   def initialize(course, students)
#    @course = course
#    @students = students
#  end

#  def short_description
#    "Course: #{course.name} has #{students.length} students"
#  end
#session = Session.new(course1, [student1, student2])
#session.short_description


# def method(options={})
#   first_name = options[:first_name] || 'John'
#   last_name = options[:last_name]
#
#   "#{first_name} #{last_name}"
# end
#
#
# def method(first_name:, last_name: 'Lee')
#   "#{first_name} #{last_name}"
# end
#
# method('John')
