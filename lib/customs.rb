class Customs
  def sum_of_yeses(groups)
    sum = 0
    groups.each do |group|
      yeses = Set.new
      group.each do |person|
        person.each_char do |letter|
          yeses.add(letter)
        end
      end

      sum += yeses.length
    end

    sum
  end

  def sum_of_unanimous_yeses(groups)
    sum = 0
    groups.each do |group|
      headcount = group.length
      yeses = {}
      group.each do |person|
        person.each_char do |letter|
          if yeses[letter]
            yeses[letter] += 1
          else
            yeses[letter] = 1
          end
        end
      end

      yeses.filter! { |letter,count| count == headcount }
      sum += yeses.length
    end

    sum
  end
end