class StudentsController < ApplicationController
  def index
  	@students = Student.all
  end

  def new
  	student = Student.find(params[:id])
    # if params[:course][:title]
	  course_title = params[:course][:title]
	  course = Course.where(:title => course_title).first
	  enrollment = student.enrollments.build(:course_id => course.id)
	  respond_to do |format|
    if enrollment.save
   	  format.html {redirect_to :back}
	  else 
	    format.html {render action: "index"}
	  end
    # end
    # elsif params[:answer]
    #   respond_to do |format|
    #   if @student.save
    #     format.html {redirect_to :back}
    #   else 
    #     format.html {render action: "index"}
    #   end
    # end
	end
  end

  def create
  	@student = Student.new(params[:student])
  	respond_to do |format|
  	  if @student.save
  	  	format.html {redirect_to :back}
  	  else 
  	  	format.html {render action: "index"}
  	  end
  	end
  end 

  def show 
  	@student = Student.find_by_id(params[:id])
  	@datas = @student.get_assignments_and_answers
    @courses = Course.all
  	respond_to do |format| 
  		format.html {render "courses.html.erb"}
  	end
  end

  def submit
  end
end
