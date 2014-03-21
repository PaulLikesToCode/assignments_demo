class CoursesController < ApplicationController
  def index
  	@ca = {}
  	@courses = Course.all
  	for course in @courses
  		

  	end
  end

	def create
	  @course = Course.new(params[:course])
	  respond_to do |format|
	  	if @course.save
	  	  format.html {redirect_to :back}
	  	else 
	  	  format.html {render action: "index"}
	  	end
	  end 
	end
end
