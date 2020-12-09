class HandheldBoot
  def initialize
    # array with hash values { op_type, step }
    @instructions = []
    @pointer = 0
    @accumulator = 0
    @previously_executed = Set.new([])
  end

  def read_instructions(file)
    f = File.open(file, "r")
    f.each_line do |line|
      operation, increment = line.split(' ')
      instruction = { op_type: operation, step: increment.to_i }
      @instructions.push(instruction)
    end
    @instructions
  end

  def accumulation_before_any_repeats(file)
    read_instructions(file)

    while !@previously_executed.include?(@pointer) do
      @previously_executed.add(@pointer)
      instruction = @instructions[@pointer]

      if instruction[:op_type] == 'nop'
        @pointer += 1
      elsif instruction[:op_type] == 'acc'
        @accumulator += instruction[:step]
        @pointer += 1
      elsif
        instruction[:op_type] == 'jmp'
        @pointer += instruction[:step]
      end
    end

    @accumulator
  end

  def accumulation_after_terminates(file)
    read_instructions(file)

    (0..@instructions.length-1).each do |k|
      modified_instructions = Marshal.load(Marshal.dump(@instructions))
      next if modified_instructions[k][:op_type] == 'acc'

      modified_instructions[k][:op_type] = modified_instructions[k][:op_type] == 'nop' ? 'jmp' : 'nop'
      @pointer = 0
      @accumulator = 0
      @previously_executed = Set.new([])
      break if does_program_terminate?(modified_instructions)
    end

    @accumulator
  end

  def does_program_terminate?(modified_instructions)
    while !@previously_executed.include?(@pointer) do
      return true unless modified_instructions[@pointer]
      @previously_executed.add(@pointer)
      instruction = modified_instructions[@pointer]

      if instruction[:op_type] == 'nop'
        @pointer += 1
      elsif instruction[:op_type] == 'acc'
        @accumulator += instruction[:step]
        @pointer += 1
      elsif
        instruction[:op_type] == 'jmp'
        @pointer += instruction[:step]
      end
    end

    false
  end
end