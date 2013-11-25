module ApplicationHelper

	def flash_clash_type(type)
		case type
		when :alert
			"alert-error"	
		when :notice
			"alert-success"
		else
			""
		end
	end

end
