class RockPaperScissor
  LOSS = 0
  DRAW = 3
  WIN = 6

  RULES = {
    "A" => "Z", # Rock defeats scissor
    "B" => "X", # Paper defeats Rock
    "C" => "Y", # Scissor defeats paper
  }
  
  MAPPING = {
    "A" => "X", # Rock
    "B" => "Y", # Paper
    "C" => "Z", # Scissor
  }

  MODIFIER = {
    "X" => 1, # ROCK
    "Y" => 2, # PAPER
    "Z" => 3, # SCISSORS
  }

  def initialize(file)
    @file = file
  end

  def your_score
    game_rounds.map do |round|
      play(round)
    end.sum
  end

  def play(round)
    # Score modifier
    mod = MODIFIER[round.last]
    # Player 1 wins
    return mod + LOSS if RULES[round.first] == round.last
    # Draw
    return mod + DRAW if MAPPING[round.first] == round.last
    # Player 2 wins
    return mod + WIN
  end

  def game_rounds
    @_game_rounds ||= File.readlines(@file).map { |line| line.split(" ") }
  end
end
