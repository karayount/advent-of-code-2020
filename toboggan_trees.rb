class TobogganTrees
  def count_trees_in_path(input, down_step, right_step)
    tree_count = 0
    row = 0
    column = 0
    tree = '#'

    input.each_with_index do |tree_row, index|
      unless row > input.length
        if input[row][column] == tree
          tree_count += 1
        end
        row += down_step
        column += right_step
      end
    end

    tree_count
  end

  def product_of_tree_counts(input)
    product = 1
    product *= count_trees_in_path(input, 1, 1)
    product *= count_trees_in_path(input, 1, 3)
    product *= count_trees_in_path(input, 1, 5)
    product *= count_trees_in_path(input, 1, 7)
    product *= count_trees_in_path(input, 2, 1)

    product
  end
end
