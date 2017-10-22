require_relative('course.rb')
require_relative('user.rb')
require_relative('students.rb')
require_relative('enrollment.rb')

student1 = Student.new(first_name: 'John', last_name: 'Lee', university: 'UVA')
student2 = Student.new(first_name: 'Mary', last_name: 'G', university: 'Berkley')

course1 = Course.new(course: 'Product Management')
course2 = Course.new(course: 'Consulting')


enrollments = []
enrollments << student1.enroll(course1)
enrollments << student2.enroll(course2)

enrollments.each do |enrollment|
  puts enrollment.to_s
end

p student1.enroll?(course1) # true
p student2.enroll?(course2) # true
p student2.enroll?(course1) # false

class FormCollector
  CSV.open("student.csv", "a") do |csv|
    csv << [params[:first_name], params[:last_name], params[:university], params[:course]]
end
