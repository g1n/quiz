class QuestionsController < RegexQuestionController

  def index
    @questions = Question.all
  end
  
  def show
    @question = get_current_question
	dbpatterns = Answer.where(level: params[:id].to_i).order(id: :asc)
	if ( params[:commit] != nil )
		verify reduce(params[:attempt]), dbpatterns
	end
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
  
  def edit
	@question = get_current_question
  end
  
  def update
	@question = get_current_question
	
	if @question.update(question_params)
	    redirect_to @question
	else
	    render 'edit'
	end
  end
  
  def create
    @question = Question.new(question_params)
	@question.save
	redirect_to @question
  end
  
  private
	def get_current_question
		_id = params[:id].to_i
		return Question.find_by(level: _id)
	end
  
	def question_params
	    params.require(:question).permit(:level, :content, :qtype)
	end
	
	def reduce val
		if (val == nil)
			return ""
		end
		
		if ( val.is_a?(String) )
			return val
		else
			return val.join("")
		end
	end
end
