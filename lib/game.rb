require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :x_used, :o_used, :queried_letter, :query_count

  def initialize
    @query_count = 0
    @x_used = false
    @o_used = false
  end

  # rubocop:disable Metrics/MethodLength
  def start
    player1, player2 = query_players_letters
    players = [player1, player2]

    board = Board.new
    board.display

    until board.full? == true
      players.each do |player|
        query_player_move(player)
        board.update(player.move, player.letter)
        board.display
      end
    end
  end

  def query_letter
    self.query_count += 1

    query_count > 2 ? puts('Try a different letter:') : puts('Pick x or o:')

    self.queried_letter = gets.chomp.downcase

    self.x_used = true if queried_letter == 'x'
    self.o_used = true if queried_letter == 'o'
  end

  # Would like to clean and DRY up this method
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

  def query_player_move(player)
    puts "Player #{player.number} make a move:"
    player_move = gets.to_i
    player.move = player_move
  end
end

g = Game.new
g.start
