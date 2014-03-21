class Course < ActiveRecord::Base
  
  has_many :enrollments
  has_many :assignments
  has_many :students, :through => :enrollment

  attr_accessible :title, :id, :created_at, :updated_at

  def get_assign
  	@assignments = Assignment.where(:course_id => self.id)
  	return @assignments
  end
end
