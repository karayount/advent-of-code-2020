class Bags
  def initialize
    # hash with keys bag type, value hash with keys other bag type, values count
    @contents = {}
    # hash with keys bag type, value Set
    @contained_by = {}
  end

  def read_bag_rules(file)
    f = File.open(file, "r")
    f.each_line do |line|
      container, rest = line.strip.delete('.').split(' bags contain ')
      contained = rest
        .split(', ')
        .map{ |inside| [inside.chars[2..-1].join('').gsub(/(bags|bag)/, '').strip, inside == 'no other bags' ? nil : inside.chars[0].to_i] }
        .to_h
        .compact

      contained.each do |type, count|
        unless type.empty?
          if @contents[container]
            @contents[container][type] = count
          else
            @contents[container] = { type => count }
          end
          if @contained_by[type]
            @contained_by[type].add(container)
          else
            @contained_by[type] = Set.new([container])
          end
        end
      end
    end
  end

  def how_many_contain_shiny_gold(file)
    read_bag_rules(file)

    find_all_possible_containers('shiny gold').length
  end

  def find_all_possible_containers(contained, all_possible_containers = Set.new([]))
    some_containers = @contained_by[contained]
    return all_possible_containers unless some_containers

    all_possible_containers.merge(some_containers)
    some_containers.each do |one_container|
      all_possible_containers.merge(find_all_possible_containers(one_container, all_possible_containers))
    end

    all_possible_containers
  end

  def how_many_inside_shiny_gold(file)
    read_bag_rules(file)

    find_count_inside('shiny gold')
  end

  def find_count_inside(bag_type, sum = 0)
    return 0 unless @contents[bag_type]

    @contents[bag_type].each do |inner_bag_type, count|
      sum += count + count * find_count_inside(inner_bag_type)
    end

    sum
  end
end