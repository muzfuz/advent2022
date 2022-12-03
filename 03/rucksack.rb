class Rucksack
  LETTERS = [*'a'..'z', *'A'..'Z']

  def initialize(file)
    @file = file
  end

  def sum_priority
    compartments.map do |items|
      letter = (items.first & items.last).join
      priority_for(letter)
    end.sum
  end

  def priority_for(letter)
    LETTERS.find_index(letter) + 1
  end

  def compartments
    @_compartments ||= File.readlines(@file).map do |line|
      # Split each rucksack into two compartments
      # and then read each item (letter) into an array
      # ex CrZsJsPPZsGzwwsLwLmpwMDw becomes
      #  [
      #    ["C", "r", "Z", "s", "J", "s", "P", "P", "Z", "s", "G", "z"],
      #    ["w", "w", "s", "L", "w", "L", "m", "p", "w", "M", "D", "w"],
      #  ]
      line
        .strip
        .chars
        .each_slice(line.size / 2)
        .to_a
    end
  end
end
