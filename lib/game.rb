require_relative 'player'
# require_relative 'player_input'

class Game
  # future game loop here
  def start
    puts 'Player 1:'
    player1_input = PlayerInput.new
    player1_input.query_mark
    player1 = Player.new(player1_input.mark)

    puts 'Player 2:'
    player2_input = PlayerInput.new
    player2_input.query_mark
    player2 = Player.new(player2_input.mark)
  end
end
