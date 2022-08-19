require_relative 'player_input'

class Player
  @@x_used = false
  @@o_used = false

  attr_reader :mark

  def initialize(mark)
    self.mark = mark
  end

  def mark=(mark)
    if mark == 'x' && x_used? == false
      @mark = mark
      self.x_used = true
    elsif mark == 'o' && o_used? == false
      @mark = mark
      self.o_used = true
    else
      puts 'mark has been taken'
    end
  end

  def x_used?
    @@x_used
  end

  def x_used=(bool)
    @@x_used = bool
  end

  def o_used?
    @@o_used
  end

  def o_used=(bool)
    @@o_used = bool
  end
end

player1_input = PlayerInput.new
puts 'Player 1:'
player1_input.query_mark

player1 = Player.new(player1_input.mark)

player2_input = PlayerInput.new
puts 'Player 2:'
player2_input.query_mark

player2 = Player.new(player2_input.mark)
