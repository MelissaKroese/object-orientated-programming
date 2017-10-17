class Student < User
  attr_reader :university
  def initialize(first_name:, last_name:, university:)
    super(first_name, last_name)
    @university = university
    @enrollments = []
  end

  def name
    [@first_name, @last_name].join(' ')
  end

  def enroll(course)
    enrollment = Enrollment.new(self, course)
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
