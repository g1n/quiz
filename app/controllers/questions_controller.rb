class QuestionsController < RegexQuestionController

  def index
    @questions = Question.all
  end
  
  def show
	level = params[:id].to_i
	user = session.id
    @question = get_current_question
	dbpatterns = Answer.where(level: level).order(id: :asc)
	if ( params[:commit] != nil )
		matches = verify reduce(params[:attempt]), dbpatterns
		Attempt.save_matches(level, user, matches)
	end
	@status = get_level_status(level, user)
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
	
	def get_level_status(level, user)
		answers = Answer.where(level: params[:id].to_i).order(id: :asc)
		attempts = Attempt.where(level: level, who: user)
		
		@solved = Array.new
		for attempt in attempts
			@solved.push(attempt.value)
		end
		
		status = Array.new
		for answer in answers
			if ( @solved.include? answer.id )
				if ( answer.positive )
					status.push(1)
				else
					status.push(-1)
				end
			else
				if ( answer.positive )
					status.push(2)
				else
					status.push(-2)
				end
			end
		end
		return status
	end
end
