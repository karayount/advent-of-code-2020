require './input/reader.rb'

class ExpenseReport
  def product_for_2020_sum(input)
    input.each do |twenty|
      other = 2020 - twenty
      if input.include?(other) 
        return twenty * other
      end
      input.delete(twenty)
    end
  end

  def product_for_3_to_2020_sum(input)
    input.each_with_index do |number, i|
      (i+1..input.length-1).each do |j|
        (j+1..input.length-1).each do |k|
          if input[i] + input[j] + input[k] == 2020
            return input[i] * input[j] * input[k]
          end
        end
      end
    end 
  end
end
