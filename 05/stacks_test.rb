require "test/unit"
require_relative "./stacks"

class StacksTest < Test::Unit::TestCase
  def setup
    crates = {
      1 => ["Z", "N"],
      2 => ["M", "C", "D"],
      3 => ["P"],
    }

    @stacks = Stacks.new(crates, "./input_test.txt")
  end

  def test_instructions
    expected_instructions = [
      [1, 2, 1],
      [3, 1, 3],
      [2, 2, 1],
      [1, 1, 2],
    ]
    assert(@stacks.instructions == expected_instructions, "Instructions should be parsed to an array")
  end

  def test_arrange
    expected_arrangement = {
      1 => ["C"],
      2 => ["M"],
      3 => ["P", "D", "N", "Z"],
    }
    @stacks.arrange!
    assert(@stacks.crates == expected_arrangement, "The crane arranges correctly")
  end

  def test_top_crates
    assert(@stacks.top_crates == "CMZ", "The top crates are correctly returned")
  end

  def test_arrange_9001
    expected_arrangement = {
      1 => ["M"],
      2 => ["C"],
      3 => ["P", "Z", "N", "D"],
    }
    @stacks.arrange_9001!
    assert(@stacks.crates == expected_arrangement, "The crane arranges correctly")
  end

  def test_top_crates_9001
    assert(@stacks.top_crates_9001 == "MCD", "The top crates are correctly returned")
  end
end
