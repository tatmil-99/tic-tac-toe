require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :x_used, :o_used, :queried_letter, :query_count

  def initialize
    @query_count = 0
    @x_used = false
    @o_used = false
  end

  def start
    player1, player2 = query_players_letters

    b = Board.new
    b.display

    query_player_move(player1)

    puts player1.move

    b.update_board(player1.move)
    p b.taken_squares
    b.display
  end

  def query_letter
    self.query_count += 1

    query_count > 2 ? puts('Try a different letter:') : puts('Pick x or o:')

    self.queried_letter = gets.chomp.downcase

    self.x_used = true if queried_letter == 'x'
    self.o_used = true if queried_letter == 'o'
  end

  def query_players_letters
    puts 'Player 1:'
    query_letter
    player1 = Player.new(queried_letter)

    until x_used && o_used
      puts 'Player 2:'
      query_letter
      player2 = Player.new(queried_letter)
    end

    [player1, player2]
  end

  # may include player2 as argument
  def query_player_move(player1)
    # get player input
    puts 'Player 1 move:'
    player_move = gets.to_i
    # pass input to a move method in player
    player1.move = player_move
  end
end

g = Game.new
g.start
