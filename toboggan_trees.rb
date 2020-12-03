class TobogganTrees
  def count_trees_in_path(input, slope)
    tree_count = 0
    row = 0
    column = 0
    tree = '#'

    input.each_with_index do |tree_row, index|
      unless row > input.length
        if input[row][column] == tree
          tree_count += 1
        end
        row += slope[:y]
        column += slope[:x]
      end
    end

    tree_count
  end

  def product_of_tree_counts(input)
    product = 1
    slopes = [
      { x: 1, y: 1},
      { x: 3, y: 1},
      { x: 5, y: 1},
      { x: 7, y: 1},
      { x: 1, y: 2}
    ]
    slopes.each do |slope|
      product *= count_trees_in_path(input, slope)
    end

    product
  end
end
