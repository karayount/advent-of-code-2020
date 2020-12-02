require './corrupt_passwords.rb'
require './input/reader.rb'


describe 'CorruptPasswords' do
  describe '#count_valid_passwords' do
    it 'example' do
      reader = Reader.new
      input = reader.read_corrupt_passwords('./input/day_02_example.txt')

      corrupt_passwords = CorruptPasswords.new
      expect(corrupt_passwords.count_valid_passwords(input)).to eql(2)
    end

    it 'day 2 part 1' do
      reader = Reader.new
      input = reader.read_corrupt_passwords('./input/day_02_input.txt')

      corrupt_passwords = CorruptPasswords.new
      expect(corrupt_passwords.count_valid_passwords(input)).to eql(483)
    end
  end

  describe '#count_valid_part_2_passwords' do
    it 'example' do
      reader = Reader.new
      input = reader.read_corrupt_passwords('./input/day_02_example.txt')

      corrupt_passwords = CorruptPasswords.new
      expect(corrupt_passwords.count_valid_part_2_passwords(input)).to eql(1)
    end

    it 'day 2 part 2' do
      reader = Reader.new
      input = reader.read_corrupt_passwords('./input/day_02_input.txt')

      corrupt_passwords = CorruptPasswords.new
      expect(corrupt_passwords.count_valid_part_2_passwords(input)).to eql(482)
    end
  end
end