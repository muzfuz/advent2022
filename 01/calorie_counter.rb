class CalorieCounter
  def initialize(file)
    @file = file
  end

  def max_calories
    calorie_list.values.max
  end

  def top_three_total
    calorie_list.values.max(3).sum
  end

  def elf_with_most_food
    calorie_list.key(max_calories)
  end

  def calorie_list
    @_calorie_list ||= parsed_data
  end

  private

  def parsed_data
    elf = 1
    result = Hash.new(0)
    File.open(@file, "r") do |f|
      f.each_line do |line|
        elf += 1 if line == "\n"
        result[elf] += line.to_i
      end
    end
    result
  end
end
