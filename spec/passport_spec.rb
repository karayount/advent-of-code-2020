require './passport.rb'
require './input/reader.rb'

reader = Reader.new
part_1_example_input = reader.read_passports('./input/day_04_part_1_example.txt')
part_2_example_input = reader.read_passports('./input/day_04_part_2_example.txt')
puzzle_input = reader.read_passports('./input/day_04_input.txt')

describe 'Passport' do
  describe '#count_all_fields_present' do
    it 'example' do
      passport = Passport.new
      expect(passport.count_all_fields_present(part_1_example_input)).to eql(2)
    end

    it 'day 4 part 1' do
      passport = Passport.new
      expect(passport.count_all_fields_present(puzzle_input)).to eql(202)
    end
  end

  describe '#count_all_fields_valid' do
    it 'example' do
      passport = Passport.new
      expect(passport.count_all_fields_valid(part_2_example_input)).to eql(4)
    end

    it 'day 4 part 2' do
      passport = Passport.new
      expect(passport.count_all_fields_valid(puzzle_input)).to eql(137)
    end
  end
end