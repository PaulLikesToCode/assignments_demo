class AssignmentsController < ApplicationController
  def create
	  @assignment = Assignment.new(params[:assignment])
	  respond_to do |format|
	  	if @assignment.save
	  	  format.html {redirect_to :back}
	  	else 
	  	  format.html {render action: "index"}
	  	end
	  end 
	end


end
