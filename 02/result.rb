require_relative "./rps"
require_relative "./rps_fixed"

rps = RockPaperScissor.new("./input.txt")
puts "Your final score is #{rps.your_score}"

rps = RockPaperScissorFixed.new("./input.txt")
puts "Your real score is #{rps.your_score}"
