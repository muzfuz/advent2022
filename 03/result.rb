require_relative "./rucksack"

rucksack = Rucksack.new("./input.txt")
puts "The total priority is #{rucksack.sum_priority}"
puts "The badge total is #{rucksack.sum_badges}"