class Encod
  def initialize(input)
    @input = input
  end

  def find_first_weakness(preamble_length)
    walk_index = preamble_length
    while walk_index < @input.length do
      current_number_under_test = @input[walk_index]
      found_a_pair = false
      (walk_index-preamble_length..walk_index-1).each do |preamble_a|
        (walk_index-preamble_length..walk_index-1).each do |preamble_b|
          if @input[preamble_a] + @input[preamble_b] == current_number_under_test
            found_a_pair = true
          end
        end
      end

      if found_a_pair == false
        return current_number_under_test
      end

      walk_index += 1
    end

    walk_index
  end

  def encyrption_weakness(sum_to_find)
    lower = 0
    upper = 1
    range_sum = sum_of_range(lower, upper)
    while range_sum != sum_to_find do
      if range_sum > sum_to_find
        lower += 1
      else
        upper += 1
      end
      range_sum = sum_of_range(lower, upper)
    end
    return add_smallest_and_largest(lower, upper)
  end

  def sum_of_range(lower, upper)
    sum = 0
    (lower..upper).each do |i|
      sum += @input[i]
    end
    sum
  end

  def add_smallest_and_largest(lower, upper)
    ordered = @input[lower..upper].sort!
    ordered[0] + ordered[-1]
  end
end