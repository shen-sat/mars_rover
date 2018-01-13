require 'Open3'

describe 'application' do 
	it 'should run application' do 
		Open3.popen3('ruby application.rb')	do |stdin, stdout, stderr, thread|
			stdin.puts("5 5")
			stdin.puts("1 2 N")
			stdin.puts("LMLMLMLMM")
			stdin.puts("3 3 E")
			stdin.puts("MMRMMRMRRM")
			stdin.puts("")
			result = stdout.read

			welcome_message ="Please enter inputs line by line, followed by a new line at the end:\n"
			first_rover_result = "1 3 N\n"
			second_rover_result = "5 1 E\n"
			expect(result).to eq(welcome_message+first_rover_result+second_rover_result)

		end

	end

	it 'should return error if Rover goes beyond plateau' do 
		Open3.popen3('ruby application.rb')	do |stdin, stdout, stderr, thread|
			stdin.puts("5 5")
			stdin.puts("1 2 N")
			stdin.puts("MMMMMMMMMM")
			stdin.puts("")

			welcome_message ="Please enter inputs line by line, followed by a new line at the end:\n"
			expect(stdout.read).to eq(welcome_message + "Rover overboard!: Please try again\n")

		end

	end

	it 'should return error if user enters incorrect plateau and then prompt user to re-enter plateau' do 
		Open3.popen3('ruby application.rb')	do |stdin, stdout, stderr, thread|
			stdin.puts("5 A")
			stdin.puts("5 A")
			stdin.puts("5 5")
			stdin.puts("1 2 N")
			stdin.puts("LMLMLMLMM")
			stdin.puts("")

			welcome_message ="Please enter inputs line by line, followed by a new line at the end:\n"
			wrong_plat = "Incorrect plateau: Please try again\n"
			answer = "1 3 N\n"
			expect(stdout.read).to eq(welcome_message + wrong_plat + wrong_plat + answer)

		end

	end
end