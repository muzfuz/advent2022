class RockPaperScissorFixed
  LOSS  = 0
  DRAW  = 3
  WIN   = 6

  ROCK    = "A"
  PAPER   = "B"
  SCISSOR = "C"

  MODIFIER = {
    ROCK    => 1,
    PAPER   => 2,
    SCISSOR => 3,
  }

  RULES = {
    ROCK    => SCISSOR,
    PAPER   => ROCK,
    SCISSOR => PAPER,
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
    # LOSS
    return MODIFIER[RULES[round.first]] + LOSS if round.last == "X"
    
    # DRAW
    return MODIFIER[round.first] + DRAW if round.last == "Y"
  
    # "Z" WIN
    return MODIFIER[RULES.key(round.first)] + WIN
  end

  def game_rounds
    @_game_rounds ||= File.readlines(@file).map { |line| line.split(" ") }
  end
end
