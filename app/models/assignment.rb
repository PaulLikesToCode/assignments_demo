class Assignment < ActiveRecord::Base
  belongs_to :course

  attr_accessible :questionone, :questiontwo, :course_id

  def get_answers(student_id)
  	@answers = Answer.where(:assignment_id => self.id, :student_id => student_id)
  	return @answers
  end
end
