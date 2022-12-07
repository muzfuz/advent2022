class Stacks
  def initialize(crates, file)
    @crates, @file = crates, file
  end

  attr_reader :crates

  def top_crates
    arrange!
    crates.each_value.map { |crate| crate.last }.join
  end

  def arrange!
    instructions.each do |instruction|
      instruction[0].times do
        crates[instruction[2]].append(crates[instruction[1]].pop)
      end
    end
  end

  def instructions
    @_instructions ||= File.readlines(@file).map do |line|
      line.scan(/\d+/).map(&:to_i)
    end
  end
end
