require "test/unit"
require_relative "./fs"

class FileSystemTest < Test::Unit::TestCase
  def setup
    @fs = FileSystem.new("./input_test.txt")
  end

  def test_sum_large_dirs
    assert @fs.sum_large_dirs == 95437, "The sum of the biggest directories equals 95437"
  end

  def test_sum_full_dataset
    assert FileSystem.new("./input.txt").sum_large_dirs == 1084134, "The total input value is 1084134"
  end

  def test_free_up_memory
    assert @fs.free_up_memory == 24933642, "The correct amount of memory to free up is 24933642"
  end
end
