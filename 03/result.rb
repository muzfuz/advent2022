require_relative "./rucksack"

rucksack = Rucksack.new("./input.txt")
puts "The total priority is #{rucksack.sum_priority}"

