class Player
  @@players_created = 0

  attr_accessor :letter, :move, :number

  def initialize(letter)
    @@players_created += 1
    self.letter = letter
    self.number = @@players_created
  end
end
