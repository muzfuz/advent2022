require "test/unit"

require_relative "./rps"

class RockPaperScissorTest < Test::Unit::TestCase
  def setup
    @cc = RockPaperScissor.new("./input_test.txt")
  end

  def test_your_score
    assert(@cc.your_score == 15, "Assert score equals 15")
  end

  def test_play
    assert(@cc.play(["A", "Y"]) == 8, "Your score in round 1 is 8")
    assert(@cc.play(["B", "X"]) == 1, "Your score in round 2 is 1")
    assert(@cc.play(["C", "Z"]) == 6, "Your score in round 3 is 6")
  end

  def test_game_rounds
    assert(@cc.game_rounds == [["A", "Y"], ["B", "X"], ["C", "Z"]], "Game rounds parsed correctly")
  end
end

