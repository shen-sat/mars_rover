require_relative '../lib/input_parser.rb'

describe 'plateau input handling' do
	let(:input) {InputParser.new}

	it 'should accept correct input' do
		expect(input.validate_plateau("5 5")).to eq([5, 5])
	end

	it 'should not accept letters' do
		expect{input.validate_plateau("WW")}.to raise_error(RuntimeError, "Incorrect plateau")
	end 

	it 'should not accept too many characters' do
		expect{input.validate_plateau("555")}.to raise_error(RuntimeError, "Incorrect plateau")
	end

	it 'should not accept too few characters' do
		expect{input.validate_plateau("5")}.to raise_error(RuntimeError, "Incorrect plateau")
	end

	it 'should not accept blank spaces' do 
		expect{input.validate_plateau("5 ")}.to raise_error(RuntimeError, "Incorrect plateau")
	end

end

describe 'start position input handling' do 
	let(:input) {InputParser.new}
	
	it 'should accept correct input' do
		expect(input.validate_start_pos("1 2 N")).to eq ([1, 2, "N"])
	end

	it 'should only accept valid direction character' do
		expect{input.validate_start_pos("1 2 NN")}.to raise_error(RuntimeError, "Incorrect position")
	end

	it 'should only accept two numbers followed by a letter' do
		expect{input.validate_start_pos("1 N 2")}.to raise_error(RuntimeError, "Incorrect position")
		expect{input.validate_start_pos("N 1 2")}.to raise_error(RuntimeError, "Incorrect position")
		expect{input.validate_start_pos("N N N")}.to raise_error(RuntimeError, "Incorrect position")
		expect{input.validate_start_pos("1 1 1")}.to raise_error(RuntimeError, "Incorrect position")
	end

	it 'should only accept N,S,E and W as third character' do 
		expect{input.validate_start_pos("1 2 T")}.to raise_error(RuntimeError, "Incorrect position")
	end

	it 'should accept small caps n,e,s and w' do
		expect(input.validate_start_pos("1 2 n")).to eq([1, 2,"N"])
	end

	it 'should accept spaces between characters' do 
		expect{input.validate_start_pos("11N")}.to raise_error(RuntimeError, "Incorrect position")
	end
end		


describe 'instruction input handling' do 
	let(:input) {InputParser.new}

	it 'should accept correct input' do 
		expect(input.validate_instruct("LMR")).to eq(["L", "M", "R"])
	end

	it 'should not accept any letters other than L,M and R' do
		 expect{input.validate_instruct("LMW")}.to raise_error(RuntimeError, "Incorrect instruct")
	end

	it 'should accept lower case L,M and R' do
		 expect(input.validate_instruct("lmr")).to eq(["L", "M", "R"])
	end

	it 'should not accept blank spaces' do 
		expect{input.validate_instruct("L M R")}.to raise_error(RuntimeError, "Incorrect instruct")
	end

end