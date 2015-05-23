class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find_by(level: params[:id])
  end
  
  def new
    @question = Question.new
	_last = Question.order(level: :asc).last
	if _last == nil
		@question.level = 1
	else
		@question.level = _last.level + 1
	end
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:level, :content))
	@question.save
	redirect_to @question
  end
end
