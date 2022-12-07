require "test/unit"
require_relative "./signal"

class SignalTest < Test::Unit::TestCase
  def setup
    @signal = SignalDevice.new
  end

  def test_start
    assert(@signal.start("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7, "First marker is at 7")
    assert(@signal.start("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5, "First marker is at 5")
    assert(@signal.start("nppdvjthqldpwncqszvftbrmjlhg") == 6, "First marker is at 6")
    assert(@signal.start("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10, "First marker is at 10")
    assert(@signal.start("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11, "First marker is at 11")
  end
  
  def test_message
    assert(@signal.message("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 19, "First marker is at 19")
    assert(@signal.message("bvwbjplbgvbhsrlpgdmjqwftvncz") == 23, "First marker is at 23")
    assert(@signal.message("nppdvjthqldpwncqszvftbrmjlhg") == 23, "First marker is at 23")
    assert(@signal.message("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 29, "First marker is at 29")
    assert(@signal.message("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 26, "First marker is at 26")
  end
end
