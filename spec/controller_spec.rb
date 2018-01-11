require_relative '../lib/controller.rb'

describe 'controller' do 
	it 'should parse plateau' do 
		controller = Controller.new
		controller.read_plateau("5 6")
		expect(controller.plateau.width).to eq(5)
		expect(controller.plateau.height).to eq(6)
	end
end