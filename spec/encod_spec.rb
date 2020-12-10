require './lib/encod.rb'
require './input/reader.rb'

reader = Reader.new
example_input = reader.read_input_to_number_array('./input/day_09_example.txt')
puzzle_input = reader.read_input_to_number_array('./input/day_09_input.txt')

describe 'Encod' do
  describe '#find_first_weakness' do
    it 'example' do
      encod = Encod.new(example_input)
      expect(encod.find_first_weakness(5)).to eql(127)
    end

    it 'day 9 part 1' do
      encod = Encod.new(puzzle_input)
      expect(encod.find_first_weakness(25)).to eql(400480901)
    end
  end

  describe '#encyrption_weakness' do
    it 'example' do
      encod = Encod.new(example_input)
      expect(encod.encyrption_weakness(127)).to eql(62)
    end

    it 'day 9 part 2' do
      encod = Encod.new(puzzle_input)
      expect(encod.encyrption_weakness(400480901)).to eql(67587168)
    end
  end
end