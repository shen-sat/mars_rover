class Controller
	attr_reader :plateau, :start_pos
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

	def feed_result
		begin
			@res += Rover.new(@start_pos[0], @start_pos[1], @start_pos[2], @instructions, plateau).end_position + "\n"
		rescue RuntimeError => err
			puts "#{err}: Please try again"
			@rover_fall = true
		end
	end


	def read_start_pos(start_pos_str)
		input_parser = InputParser.new
		@start_pos = input_parser.validate_start_pos(start_pos_str)
	end

	def read_instructions(instructions_str)
		parser = InputParser.new
		@instructions = parser.validate_instruct(instructions_str)
	end

	def first_input
		begin
			read_plateau(gets.chomp)
		rescue RuntimeError => err
			puts "#{err}: Please try again"
			first_input
		end
	end

	def second_input
		begin
			n = gets.chomp
			if n == ""
				@end_input = true
				return
			end
			read_start_pos(n)
		rescue RuntimeError => err
			puts "#{err}: Please try again"
			second_input
		end
	end

	def third_input
		begin
			read_instructions(gets.chomp)
		rescue RuntimeError => err
			puts "#{err}: Please try again"
			third_input
		end
	end

	def run_app
		puts "Please enter inputs line by line, followed by a new line at the end:"
		@end_input = false
		@rover_fall = false
		@res = ""
		first_input
		loop do
			second_input
			break if @end_input
			third_input
			feed_result
			#break if @rover_fall
		end
		puts @res unless @rover_fall == true
	end
end
