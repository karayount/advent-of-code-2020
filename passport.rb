class Passport
  def initialize
    @required_fields = {
      byr: 'Birth Year',
      iyr: 'Issue Year',
      eyr: 'Expiration Year',
      hgt: 'Height',
      hcl: 'Hair Color',
      ecl: 'Eye Color',
      pid: 'Passport ID'
    }
  end

  def count_all_fields_present(passports)
    count = 0
    passports.each do |passport|
      count += has_all_fields?(passport) ? 1 : 0
    end

    count
  end

  def has_all_fields?(info)
    @required_fields.each_key do |field|
      if !info.has_key?(field.to_s)
        return false
      end
    end

    true
  end

  def count_all_fields_valid(passports)
    count = 0
    passports.each do |passport|
      count += all_fields_valid?(passport) ? 1 : 0
    end

    count
  end

  def all_fields_valid?(info)
    @required_fields.each_key do |field|
      field_str = field.to_s
      unless info[field_str] && send("valid_#{field_str}?", info[field_str])
        return false
      end
    end

    true
  end

  def valid_byr?(byr)
    valid_year?(byr, 1920, 2002)
  end

  def valid_iyr?(iyr)
    valid_year?(iyr, 2010, 2020)
  end

  def valid_eyr?(eyr)
    valid_year?(eyr, 2020, 2030)
  end

  def valid_year?(year, min, max)
    match = /^([0-9]{4})$/ =~ year
    match && min <= year.to_i && year.to_i <= max
  end

  def valid_hgt?(hgt)
    if /.*in$/ =~ hgt
      return 59 <= hgt[0..1].to_i && hgt[0..1].to_i <= 76
    elsif /.*cm$/ =~ hgt
      return 150 <= hgt[0..2].to_i && hgt[0..2].to_i <= 193
    else
      return false
    end
  end

  def valid_hcl?(hcl)
    match = /^#([a-f]|[0-9]){6}$/ =~ hcl

    !!match
  end

  def valid_ecl?(ecl)
    ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(ecl)
  end

  def valid_pid?(pid)
    match = /^[0-9]{9}$/ =~ pid

    !!match
  end
end