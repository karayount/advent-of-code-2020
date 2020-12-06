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

  def read_treescape(file)
    f = File.open(file, "r")
    all = []

    f.each_line do |line|
      all << line
    end

    num_rows = all.length
    num_columns = all[0].length

    all.map! do |row|
      # this replication depends on the max slope
      row = row.strip * (num_rows*7 + 1)
    end

    all.map! do |row|
      row = row.split('')
    end

    all
  end

  def read_passports(file)
    f = File.open(file, "r")
    passports = []
    current = ''

    f.each_line do |line|
      line.strip!
      if line == ''
        passport = current.split(' ').map{ |field| [field.split(':')[0], field.split(':')[1]] }.to_h
        passports.push(passport)
        current = line
      else
        current += line + ' '
      end
    end

    passport = current.split(' ').map{ |field| [field.split(':')[0], field.split(':')[1]] }.to_h
    passports.push(passport)

    passports
  end

  def read_customs_forms_groups(file)
    f = File.open(file, "r")
    groups = []
    current = []

    f.each_line do |line|
      line.strip!
      if line == ''
        groups.push(current)
        current = []
      else
        current.push(line)
      end
    end

    groups.push(current)

    groups
  end
end