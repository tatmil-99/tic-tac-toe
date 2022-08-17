class Board
  attr_accessor :board

  def initialize
    self.board = [
      [1, ' |', 2, ' |', 3],
      ['--', '|', '--', '|', '--'],
      [4, ' |', 5, ' |', 6],
      ['--', '|', '--', '|', '--'],
      [7, ' |', 8, ' |', 9]
    ]
  end

  def position(number)
    position_index = nil

    board.each do |row|
      position_index = row.index(number)
      return position_index unless position_index.nil?
    end
  end
end

b = Board.new

# b.board.each { |i| puts i.join }

puts b.position(1)
