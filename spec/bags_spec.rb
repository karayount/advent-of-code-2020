require './lib/bags.rb'
require './input/reader.rb'

describe 'Bags' do
  describe '#how_many_contain_shiny_gold' do
    it 'example' do
      bags = Bags.new
      expect(bags.how_many_contain_shiny_gold('./input/day_07_part_1_example.txt')).to eql(4)
    end

    it 'day 7 part 1' do
      bags = Bags.new
      expect(bags.how_many_contain_shiny_gold('./input/day_07_input.txt')).to eql(257)
    end
  end

  describe '#how_many_inside_shiny_gold' do
    it 'example 1' do
      bags = Bags.new
      expect(bags.how_many_inside_shiny_gold('./input/day_07_part_1_example.txt')).to eql(32)
    end

    it 'example 2' do
      bags = Bags.new
      expect(bags.how_many_inside_shiny_gold('./input/day_07_part_2_example.txt')).to eql(126)
    end

    it 'day 7 part 2' do
      bags = Bags.new
      expect(bags.how_many_inside_shiny_gold('./input/day_07_input.txt')).to eql(1038)
    end
  end
end