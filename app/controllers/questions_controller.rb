class QuestionsController < RegexQuestionController

  def index
    @questions = Question.all
  end
  
  @@patterns = [
		#1 level
			[
				/^$/,					# empty string
				/.*\d.*/,				# digit
				/.*[a-zA-Zа-яА-Я].*/,	# character
				/-/
			],
		#2 level
			[
				/^$/,
				/\w/,
				/-/
			]
		]
  
  def show
	_id = params[:id].to_i
	_value = params[:attempt]
    @question = Question.find_by(level: _id)
	# TODO process parameter
	if ( _value != nil )
		verify _value, @@patterns[_id - 1]
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
  
  def create
    @question = Question.new(params.require(:question).permit(:level, :content))
	@question.save
	redirect_to @question
  end
end
