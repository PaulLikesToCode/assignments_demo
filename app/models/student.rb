class Student < ActiveRecord::Base
  
  has_many :enrollments
  has_many :courses, :through => :enrollment

  attr_accessible :fname, :lname, :id, :created_at, :updated_at

  def get_answers
  	@answers = Answer.where(:student_id => self.id)
  	return @answers
  end

  def get_assignments
  	@enrollments = Enrollment.where(:student_id => self.id)
  	@assignments = []
  	for enrollment in enrollments
  		course = Course.find(enrollment.course_id)
  		a = Assignment.find(course.id)
  		@assignments << a
  	end
  	return @assignments
  end

  def get_assignments_and_answers
   	@enrollments = Enrollment.where(:student_id => self.id)
   	@answers = Answer.where(:student_id => self.id)
	@enroll_array = Array.new
  	for enrollment in enrollments
  		@student_data = Hash.new
  		@course = Course.find(enrollment.course_id)
  		@assigns = Assignment.where(:course_id => @course.id)
  		@student_data["course"] = @course
  		@student_data["assignments"] = Array.new
  		for assign in @assigns
  			@aa = Hash.new
  			@aa["assign"] = assign
  			for answer in @answers
  				if assign.id == answer.assignment_id
  				 	@aa["answer"] = answer
  				 	break
  				else 
  					@aa["answer"] = nil
  				end
  			end
  			@student_data["assignments"] << @aa
  		end
  		@enroll_array << @student_data
  	end
  	return @enroll_array
  end
end
