require_relative '../lib/plateau.rb'

describe 'plateau' do
	it 'should store width and height' do
	plateau = Plateau.new(5, 10)
	expect(plateau.width).to eq(5)
	expect(plateau.height).to eq(10)
	end
end