require 'set'

class Reader
  def read_input_to_number_set(file)
    f = File.open(file, "r")
    all = Set.new

    f.each_line do |line|
      all.add(line.to_i)
    end

    all
  end

  def read_input_to_number_array(file)
    f = File.open(file, "r")
    all = []

    f.each_line do |line|
      all << line.to_i
    end

    all.to_ary.flatten
  end

  def read_corrupt_passwords(file)
    f = File.open(file, "r")
    all = []

    f.each_line do |line|
      count, letter, pw = line.split
      min, max = count.split('-')
      letter.delete_suffix!(':')
      all << {min: min.to_i, max: max.to_i, letter: letter, pw: pw}
    end

    all
  end
end