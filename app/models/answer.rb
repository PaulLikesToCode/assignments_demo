class Answer < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student
  attr_accessible :answerone, :answertwo, :assignment_id, :student_id

  class << self
  	def student_answers(student_id)
   	  @answers = Answer.where(:student_id => student_id)
   	end
  end
end
