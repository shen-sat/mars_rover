class Rover
	attr_reader :x
	attr_reader :y
	attr_accessor :direction
	attr_reader :instruction

	def initialize(x, y, direction, instruction)
		@x = x
		@y = y
		@direction = direction
		@instruction = instruction
		unless @instruction.nil?
			@instruction.each do |letter|
				if letter == "L"
					rotate_left
				elsif letter == "R"
					rotate_right
				else
					move
				end
			end
		end

	end

	def rotate_left
		case @direction
		when "N"
			@direction = "W"
		when "W"
			@direction = "S"
		when "S"
			@direction = "E"
		when "E"
			@direction = "N"					
		end		
	end

	def rotate_right
		case @direction
		when "N"
			@direction = "E"
		when "W"
			@direction = "N"
		when "S"
			@direction = "W"
		when "E"
			@direction = "S"					
		end
	end

	def move
		case @direction
		when "E"
			@x += 1
		when "W"
			@x-= 1
		when "N"
			@y+= 1
		when "S"
			@y-= 1
		end
	end

	def end_position
		return "#{@x} #{@y} #{@direction}"
	end

end

