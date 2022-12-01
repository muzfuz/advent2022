require_relative "./calorie_counter"

cc = CalorieCounter.new("./input.txt")
puts "The elf with the most Calories is number #{cc.elf_with_most_food}, with a total of #{cc.max_calories} calories. The top three elves have #{cc.top_three_total} calories combined."
