require './lib/boarding_pass.rb'
require './input/reader.rb'

f = File.open('./input/day_05_input.txt', "r")
puzzle_input = []
f.each_line do |line|
  puzzle_input.push(line.strip)
end

describe 'BoardingPass' do
  describe '#highest_seat_id' do
    it 'example' do
      boarding_pass = BoardingPass.new
      expect(boarding_pass.highest_seat_id(['FBFBBFFRLR', 'BFFFBBFRRR', 'FFFBBBFRRR', 'BBFFBBFRLL'])).to eql(820)
    end

    it 'day 5 part 1' do
      boarding_pass = BoardingPass.new
      expect(boarding_pass.highest_seat_id(puzzle_input)).to eql(890)
    end
  end

  describe '#my_seat' do
    it 'day 5 part 2' do
      boarding_pass = BoardingPass.new
      expect(boarding_pass.my_seat(puzzle_input)).to eql(651)
    end
  end
end