class RegexQuestionController < ApplicationController

  def verify(candidate, answers)
	# html in the controller - like a shit!
	@debug = "<b>Value:</b><a> #{candidate}</a><br/><br/>"
	i = 0
	if ( candidate == nil )
		candidate = ""
	end
	begin
		if ( candidate =~ Regexp.new(answers[i].value) )
			color = "#99FF99"
			# TODO break loop if can match only one
		else
			color = ""
		end
		@debug += "<a style=\"background-color: #{color}\">" + answers[i].value + "</a><br/>"
		i += 1
	end until i == answers.size
	# TODO return match indexes
  end
  
end
