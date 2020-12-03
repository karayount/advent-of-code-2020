require './toboggan_trees.rb'
require './input/reader.rb'

reader = Reader.new
example_input = reader.read_treescape('./input/day_03_example.txt')
puzzle_input = reader.read_treescape('./input/day_03_input.txt')

describe 'TobogganTrees' do
  describe '#count_trees_in_path' do
    slope = { x: 3, y: 1 }

    it 'example' do
      toboggan_trees = TobogganTrees.new
      expect(toboggan_trees.count_trees_in_path(example_input, slope)).to eql(7)
    end

    it 'day 3 part 1' do
      toboggan_trees = TobogganTrees.new
      expect(toboggan_trees.count_trees_in_path(puzzle_input, slope)).to eql(211)
    end
  end

  describe '#product_of_tree_counts' do
    it 'example' do
      toboggan_trees = TobogganTrees.new
      expect(toboggan_trees.product_of_tree_counts(example_input)).to eql(336)
    end

    it 'day 3 part 2' do
      toboggan_trees = TobogganTrees.new
      expect(toboggan_trees.product_of_tree_counts(puzzle_input)).to eql(3584591857)
    end
  end
end