class AnswersController < ApplicationController
  def index
  	@answers = Answer.student_answers(params[:student_id])
  end

  def create
  	@answer = Answer.new(params[:answer])
  	respond_to do |format|
  	  if @answer.save
  	  	format.html {redirect_to :back}
  	  else 
  	  	format.html {render action: "index"}
  	  end
  	end
  end
end
