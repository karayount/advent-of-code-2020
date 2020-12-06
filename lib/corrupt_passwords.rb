require './input/reader.rb'

class CorruptPasswords
  def count_valid_passwords(input)
    count = 0
    input.each do |corrupt_password|
      min = corrupt_password[:min]
      max = corrupt_password[:max]
      letter = corrupt_password[:letter]
      pw = corrupt_password[:pw]

      letter_count = pw.count(letter)
      if letter_count <= max && letter_count >= min
        count += 1
      end
    end

    count
  end

  def count_valid_part_2_passwords(input)
    count = 0
    input.each do |corrupt_password|
      pos_a = corrupt_password[:min] - 1
      pos_b = corrupt_password[:max] - 1
      letter = corrupt_password[:letter]
      pw = corrupt_password[:pw]

      if (pw[pos_a] == letter && pw[pos_b] != letter) || (pw[pos_a] != letter && pw[pos_b] == letter)
        count += 1
      end
    end

    count
  end
end
