require "test/unit"

require_relative "./rps_fixed"

class RockPaperScissorTest < Test::Unit::TestCase
  def setup
    @cc = RockPaperScissorFixed.new("./input_test.txt")
  end

  def test_your_score
    assert(@cc.your_score == 12, "Assert score equals 12")
  end

  def test_play
    assert(@cc.play(["A", "Y"]) == 4, "Your score in round 1 is 4")
    puts @cc.play(["B", "X"])
    assert(@cc.play(["B", "X"]) == 1, "Your score in round 2 is 1")
    assert(@cc.play(["C", "Z"]) == 7, "Your score in round 3 is 7")
  end

  def test_game_rounds
    assert(@cc.game_rounds == [["A", "Y"], ["B", "X"], ["C", "Z"]], "Game rounds parsed correctly")
  end
end

