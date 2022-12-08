require "test/unit"
require_relative "./fs"

class FileSystemTest < Test::Unit::TestCase
  def setup
    @fs = FileSystem.new("./input_test.txt")
  end

  def test_sum_large_dirs
    assert @fs.sum_large_dirs == 95437, "The sum of the biggest directories equals 95437"
  end
end
