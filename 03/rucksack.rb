class Rucksack
  LETTERS = [*'a'..'z', *'A'..'Z']

  def initialize(file)
    @file = file
  end

  def sum_priority
    sum(compartments)
  end
  
  def sum_badges
    sum(contents.each_slice(3))
  end

  def sum(array)
    array.map do |batch|
      letter = batch.inject(:&).join # Find intersection of all arrays
      priority_for(letter)
    end.sum
  end

  def priority_for(letter)
    LETTERS.find_index(letter) + 1
  end

  def compartments
    # Split each rucksack into two compartments
    # and then read each item (letter) into an array
    # ex CrZsJsPPZsGzwwsLwLmpwMDw becomes
    #  [
    #    ["C", "r", "Z", "s", "J", "s", "P", "P", "Z", "s", "G", "z"],
    #    ["w", "w", "s", "L", "w", "L", "m", "p", "w", "M", "D", "w"],
    #  ]
    contents.map do |rucksack|
      rucksack.each_slice(rucksack.size / 2).to_a
    end
  end

  def contents
    @_contents ||= File.readlines(@file).map do |line|
      line
        .strip
        .chars
    end
  end
end
