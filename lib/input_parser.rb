class InputParser
	
	def validate_plateau(answer)
		if answer.match(/^\d\s\d$/)
			return answer.split(/\s/).map do |i|
				i.to_i
			end
		else
			raise "Incorrect plateau"
		end
	end

	def validate_start_pos(answer)
		if answer.match(/^\d\s\d\s[NESWnesw]$/)
			rover_pos = answer.split(/\s/)
			return [rover_pos[0].to_i, rover_pos[1].to_i, rover_pos[2].upcase]
		else
			raise "Incorrect position"
		end
	end

	def validate_instruct(answer)
		if answer.match(/^(L|R|M|l|m|r)*$/)
			return answer.upcase.split(//)
		else
			raise "Incorrect instruct"
		end
	end

end