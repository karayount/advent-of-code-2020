require './lib/handheld_boot.rb'

describe 'HandheldBoot' do
  describe '#accumulation_before_any_repeats' do
    it 'example' do
      handheld_boot = HandheldBoot.new
      expect(handheld_boot.accumulation_before_any_repeats('./input/day_08_example.txt')).to eql(5)
    end

    it 'day 8 part 1' do
      handheld_boot = HandheldBoot.new
      expect(handheld_boot.accumulation_before_any_repeats('./input/day_08_input.txt')).to eql(2058)
    end
  end

  describe '#accumulation_after_terminates' do
    it 'example' do
      handheld_boot = HandheldBoot.new
      expect(handheld_boot.accumulation_after_terminates('./input/day_08_example.txt')).to eql(8)
    end

    it 'day 8 part 2' do
      handheld_boot = HandheldBoot.new
      expect(handheld_boot.accumulation_after_terminates('./input/day_08_input.txt')).to eql(1000)
    end
  end
end