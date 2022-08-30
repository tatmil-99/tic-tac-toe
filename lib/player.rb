# require_relative 'player_input'

# do something like players_created for x/o_used????
class Player
  # @@x_used = false
  # @@o_used = false

  @@players_created = 0

  # attr_reader :letter
  attr_accessor :letter, :move, :number

  def initialize(letter)
    @@players_created += 1
    self.letter = letter
    self.number = @@players_created
  end

  # def letter=(letter)
  #   if letter == 'x' && x_used? == false
  #     @letter = letter
  #     self.x_used = true
  #   elsif letter == 'o' && o_used? == false
  #     @letter = letter
  #     self.o_used = true
  #   else
  #     puts 'letter has been taken'
  #   end
  # end

  # def x_used?
  #   @@x_used
  # end

  # def o_used?
  #   @@o_used
  # end

  # private

  # def x_used=(bool)
  #   @@x_used = bool
  # end

  # def o_used=(bool)
  #   @@o_used = bool
  # end
end

# player1_input = PlayerInput.new
# puts 'Player 1:'
# player1_input.query_letter

# player1 = Player.new(player1_input.letter)

# player2_input = PlayerInput.new
# puts 'Player 2:'
# player2_input.query_letter

# player2 = Player.new(player2_input.letter)
