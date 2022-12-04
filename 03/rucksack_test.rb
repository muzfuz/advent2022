require "test/unit"

require_relative "./rucksack"

class RucksackTest < Test::Unit::TestCase
  def setup
    @rucksack = Rucksack.new("./input_test.txt")
  end

  def test_sum_priority
    assert(@rucksack.sum_priority == 157, "Assert total priorities sum up to 157")
  end

   def test_sum_badges
    assert(@rucksack.sum_badges == 70, "Assert total priorities of badges sums to 70")
   end

  def test_priorities
    [
      ["p", 16],
      ["L", 38],
      ["P", 42],
      ["v", 22],
      ["t", 20],
      ["s", 19],
    ].each do |pair| 
      assert @rucksack.priority_for(pair.first) == pair.last, "Letter #{pair.first} should equal #{pair.last}"
    end
  end

 

  def test_rucksack_compartments
    expected_compartments = [
      [["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r"], ["h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"]], [["j", "q", "H", "R", "N", "q", "R", "j", "q", "z", "j", "G", "D", "L", "G", "L"], ["r", "s", "F", "M", "f", "F", "Z", "S", "r", "L", "r", "F", "Z", "s", "S", "L"]], [["P", "m", "m", "d", "z", "q", "P", "r", "V"], ["v", "P", "w", "w", "T", "W", "B", "w", "g"]], [["w", "M", "q", "v", "L", "M", "Z", "H", "h", "H", "M", "v", "w", "L", "H"], ["j", "b", "v", "c", "j", "n", "n", "S", "B", "n", "v", "T", "Q", "F", "n"]], [["t", "t", "g", "J", "t", "R", "G", "J"], ["Q", "c", "t", "T", "Z", "t", "Z", "T"]], [["C", "r", "Z", "s", "J", "s", "P", "P", "Z", "s", "G", "z"], ["w", "w", "s", "L", "w", "L", "m", "p", "w", "M", "D", "w"]]]
    assert @rucksack.compartments == expected_compartments, "Assert that compartments are getting split correctly"
  end
end
    