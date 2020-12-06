require './lib/customs.rb'
require './input/reader.rb'

reader = Reader.new
example_input = reader.read_customs_forms_groups('./input/day_06_example.txt')
puzzle_input = reader.read_customs_forms_groups('./input/day_06_input.txt')

describe 'Customs' do
  describe '#sum_of_yeses' do
    it 'example' do
      customs = Customs.new
      expect(customs.sum_of_yeses(example_input)).to eql(11)
    end

    it 'day 6 part 1' do
      customs = Customs.new
      expect(customs.sum_of_yeses(puzzle_input)).to eql(6630)
    end
  end

  describe '#sum_of_unanimous_yeses' do
    it 'example' do
      customs = Customs.new
      expect(customs.sum_of_unanimous_yeses(example_input)).to eql(6)
    end

    it 'day 6 part 2' do
      customs = Customs.new
      expect(customs.sum_of_unanimous_yeses(puzzle_input)).to eql(3437)
    end
  end
end