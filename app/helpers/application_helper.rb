module ApplicationHelper

	def metro_check_box(name, value, text)
		str = "<label class=\"input-control checkbox small-check\">"
		str += check_box_tag(name, value)
		str += "<span class=\"check\"></span>"\
			   "<span class=\"caption\">#{text}</span>"\
			   "</label>"
		str.html_safe
	end
	
	def metro_radio_button(name, value, text)
		str = "<label class=\"input-control radio small-check\">"
		str += radio_button_tag(name, value)
		str += "<span class=\"check\"></span>"\
			   "<span class=\"caption\">#{text}</span>"\
			   "</label>"
		str.html_safe
	end
	
	def metro_text_field(name)
		str = "<div class=\"input-control text\">"
		str += text_field_tag(name)
		str += "</div>"
		str.html_safe
	end
	
	def metro_number_field(name)
		str = "<div class=\"input-control text\">"
		str += number_field_tag(name, nil, max: 5)
		str += "</div>"
		str.html_safe
	end
end
