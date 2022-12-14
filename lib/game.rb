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
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def start
    player1, player2 = query_players_letters
    players = [player1, player2]

    board = Board.new
    puts 'Begin!'
    board.display

    # game loop
    until board.full? == true || board.three_in_a_row? == true
      players.each do |player|
        break if board.full? == true || board.three_in_a_row? == true

        # Inquire player's move until chosen square is available
        loop do
          query_player_move(player)
          break unless board.taken_squares.key?(player.move)

          puts 'square taken...'
        end

        board.update(player.move, player.letter)
        board.display

        # End of game message
        if board.three_in_a_row? == true
          puts "Player #{player.number} wins!"
        elsif board.full? == true && board.three_in_a_row? == false
          puts 'Cat wins:('
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def query_letter
    self.query_count += 1

    query_count > 2 ? puts('try a different letter:') : puts('pick x or o:')

    self.queried_letter = gets.chomp.downcase

    self.x_used = true if queried_letter == 'x'
    self.o_used = true if queried_letter == 'o'
  end

  def query_players_letters
    print 'Player 1 '
    query_letter
    player1 = Player.new(queried_letter)

    until x_used && o_used
      print 'Player 2 '
      query_letter
      player2 = Player.new(queried_letter)
    end

    [player1, player2]
  end

  def query_player_move(player)
    puts "Player #{player.number} choose a square:"
    player_move = gets.to_i
    player.move = player_move
  end
end

g = Game.new
g.start
