class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  # attr_accessible :title, :body
  attr_accessible :student_id, :course_id, :id, :created_at, :updated_at
end
