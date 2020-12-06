require './lib/expense_report.rb'
require './input/reader.rb'


describe 'ExpenseReport' do
  describe '#product_for_2020_sum' do
    it 'example' do
      input = Set.new([1721, 979, 366, 299, 675, 1456])
      expense_report = ExpenseReport.new
      expect(expense_report.product_for_2020_sum(input)).to eql(514579)
    end

    it 'day 1 part 1' do
      reader = Reader.new
      input = reader.read_input_to_number_set('./input/day_01_input.txt')

      expense_report = ExpenseReport.new
      expect(expense_report.product_for_2020_sum(input)).to eql(381699)
    end
  end

  describe '#product_for_3_to_2020_sum' do
    it 'example' do
      input = [1721, 979, 366, 299, 675, 1456]
      expense_report = ExpenseReport.new
      expect(expense_report.product_for_3_to_2020_sum(input)).to eql(241861950)
    end

    it 'day 1 part 2' do
      reader = Reader.new
      input = reader.read_input_to_number_array('./input/day_01_input.txt')

      expense_report = ExpenseReport.new
      expect(expense_report.product_for_3_to_2020_sum(input)).to eql(111605670)
    end
  end
end