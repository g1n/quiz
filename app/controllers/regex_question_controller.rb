class RegexQuestionController < ApplicationController

  def verify(candidate, answers)
	# html in the controller - like a shit!
	@debug = "<b>Value:</b><a> #{candidate}</a><br/><br/>"
	i = 0
	if ( candidate == nil )
		candidate = ""
	end
	matches = Array.new
	begin
		if ( candidate =~ Regexp.new(answers[i].value) )
			matches.push(answers[i].id)
			color = "#99FF99"
			# TODO break loop if can match only one
		else
			color = ""
		end
		@debug += "<a style=\"background-color: #{color}\">" + answers[i].value + "</a><br/>"
		i += 1
	end until i == answers.size
	# TODO return match indexes
	return matches
  end
  
end
