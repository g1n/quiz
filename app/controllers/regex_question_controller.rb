class RegexQuestionController < ApplicationController

  def verify(candidate, answers)
	@debug = candidate + "\n"
	i = 0
	begin
		if ( candidate =~ answers[i] )
			@debug += "+ "
			# TODO break loop
		else
			@debug += "- "
		end
		@debug += answers[i].source + "\n"
		i += 1
	end until i == answers.size
  end
  
end
