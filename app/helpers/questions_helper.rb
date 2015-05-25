module QuestionsHelper
	
	def level_status(data)
		str = "<div class=\"status\">"
		for i in data
			case i
			when -2
				str += image_tag("negative_inactive.png")
			when -1
				str += image_tag("negative_active.png")
			when 2
				str += image_tag("positive_inactive.png")
			when 1
				str += image_tag("positive_active.png")
			end			
		end
		str+= "</div>"
		str.html_safe
	end
end
