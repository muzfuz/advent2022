require "test/unit"

require_relative "./calorie_counter"

class CalorieCounterTest < Test::Unit::TestCase
  def setup
    @cc = CalorieCounter.new("./input_test.txt")
  end

  def test_max_calories
    assert(@cc.max_calories == 24000, "The highest number of calories is 24000")
  end

  def test_top_three_total
    assert(@cc.top_three_total == 45000, "The top 3 elves are carrying a total of 45000 calories")
  end

  def test_elf_with_most_food
    assert(@cc.elf_with_most_food == 4, "The Fourth Elf should have the most food")
  end

  def test_calorie_list
    assert(@cc.calorie_list[1] == 6000, "Elf 1 has 6000 calories")
    assert(@cc.calorie_list[2] == 4000, "Elf 2 has 4000 calories")
    assert(@cc.calorie_list[3] == 11000, "Elf 3 has 11000 calories")
    assert(@cc.calorie_list[4] == 24000, "Elf 4 has 24000 calories")
    assert(@cc.calorie_list[5] == 10000, "Elf 5 has 10000 calories")
  end
end

