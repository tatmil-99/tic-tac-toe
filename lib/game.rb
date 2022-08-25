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
    query_players_letters
  end

  def query_letter
    self.query_count += 1

    if query_count > 2
      puts 'Choose a different letter:'
    else
      puts 'Choose "x" or "o":'
    end

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
  end
end

g = Game.new
g.start
