require_relative '../lib/rover.rb'


describe 'Rover class' do
	
	it 'should accept four inputs' do
		rover = Rover.new(1, 2, "N", ["L"])
	end


	it 'should assign x = 1 for the input 1 2 N' do
		rover = Rover.new(1, 2, "N", [])
		expect(rover.x).to eq(1)
	end

	it 'should assign y = 2 for the input 12N' do
		rover = Rover.new(1, 2, "N", [])
		expect(rover.y).to eq(2)
	end
	
	it 'should assign direction = N for the input 12N' do
		rover = Rover.new(1, 2, "N", [])
		expect(rover.direction).to eq("N")
	end

	it 'should change direction to W for the input "12N, L"' do
		rover = Rover.new(1, 2, "N", ["L"])
		expect(rover.direction).to eq("W")
	end

	it 'should change direction to S for the input "12W, L"' do
		rover = Rover.new(1, 2, "W", ["L"])
		expect(rover.direction).to eq("S")
	end

	it 'should change direction to E for the input "12S, L"' do
		rover = Rover.new(1, 2, "S", ["L"])
		expect(rover.direction).to eq("E")
	end

	it 'should change direction to N for the input "12E, L"' do
		rover = Rover.new(1, 2, "E", ["L"])
		expect(rover.direction).to eq("N")
	end

	it 'should change direction to E for the input "12N, R"' do
		rover = Rover.new(1, 2, "N", ["R"])
		expect(rover.direction).to eq("E")
	end

	it 'should change direction to S for the input "12E, R"' do
		rover = Rover.new(1, 2, "E", ["R"])
		expect(rover.direction).to eq("S")
	end

	it 'should change direction to W for the input "12S, R"' do
		rover = Rover.new(1, 2, "S", ["R"])
		expect(rover.direction).to eq("W")
	end

	it 'should change direction to N for the input "12W, R"' do
		rover = Rover.new(1, 2, "W", ["R"])
		expect(rover.direction).to eq("N")
	end

	it 'should change direction to S for the input "12N, RR"' do
		rover = Rover.new(1, 2, "N", ["R", "R"])
		expect(rover.direction).to eq("S")
	end

	it 'should keep direction N for the input "12N, RL"' do
		rover = Rover.new(1, 2, "N", ["R", "L"])
		expect(rover.direction).to eq("N")
	end

	it 'should change x to 3 for the input "22E, M"' do
		rover = Rover.new(2, 2, "E", ["M"])
		expect(rover.x).to eq(3)
	end

	it 'should change x to 1 for the input "24W, M"' do
		rover = Rover.new(2, 4, "W", ["M"])
		expect(rover.x).to eq(1)
	end

	it 'should move north"' do
		rover = Rover.new(7, 3, "N", ["M"])
		expect(rover.x).to eq(7)
		expect(rover.y).to eq(4)
		expect(rover.direction).to eq("N")
	end	

	it 'should change y to 7 for the input "68S, M"' do
		rover = Rover.new(6, 8, "S", ["M"])
		expect(rover.y).to eq(7)
	end

	it 'should return an end position of "22S" for the input "23S, M"' do
		rover = Rover.new(2, 3, "S", ["M"])
		expect(rover.end_position).to eq("2 2 S")
	end

	it 'should return an end position of "34S" for the input "11E, MLMRMLMMRR"' do
		rover = Rover.new(1, 1, "E", ["M", "L", "M", "R", "M", "L", "M", "M", "R", "R"])
		expect(rover.end_position).to eq("3 4 S")
	end

	it 'should return an end position of "51E" for the input "33E, MMRMMRMRRM"' do
		rover = Rover.new(3, 3, "E", ["M", "M", "R", "M", "M", "R", "M", "R", "R", "M"])
		expect(rover.end_position).to eq("5 1 E")
	end

	it 'should return the error "Rover overboard!" for the input "12N, MMMMMMMMMM"' do
		plateau = Plateau.new(5,5)
		rover = Rover.new(1, 2, "N", ["M", "M", "M", "M", "M", "M", "M", "M", "M", "M"], plateau)
		expect{rover.end_position}.to raise_error(RuntimeError, "Rover overboard!")
	end
end



