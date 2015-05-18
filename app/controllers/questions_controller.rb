class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find_by(level: params[:id])
  end
  
  def new
    @question = Question.new
	@question.level = Question.order(level: :asc).last.level + 1
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:level, :content))
	@question.save
	redirect_to @question
  end
end
