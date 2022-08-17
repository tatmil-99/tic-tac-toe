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

  def display
    board.each { |x| puts x.join }
  end

  # returns index of square position passed as argument
  def choose_square(number)
    board.each do |row|
      square_index = row.index(number)
      break square_index unless square_index.nil?
    end
  end

  def square_available?; end
end

b = Board.new

# b.display

puts b.choose_square(8)
