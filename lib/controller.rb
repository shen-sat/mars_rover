class Controller
	attr_reader :plateau
	def initialize
		@plateau = nil
	end

	def read_plateau(plateau_str)
		input_parser = InputParser.new
		plateau_input = input_parser.validate_plateau(plateau_str)	
		@plateau = Plateau.new(plateau_input[0], plateau_input[1])
	end

	def read_rover_commands
		res = ""
		loop do
				parser = InputParser.new
				pos_str = gets.chomp	
				break if pos_str == ""
				pos_input = parser.validate_start_pos(pos_str)
				instruct = gets.chomp
				res += Rover.new(pos_input[0], pos_input[1], pos_input[2], parser.validate_instruct(instruct), plateau).end_position + "\n"
			end
		res
	end


	def run_app
		puts "Please enter inputs line by line, followed by a new line at the end:"
		begin
			read_plateau(gets.chomp)
			puts read_rover_commands
		rescue RuntimeError => err
			puts "#{err}: Please try again"
		end
	end
end
