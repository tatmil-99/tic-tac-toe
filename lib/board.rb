class Board
  attr_accessor :board, :taken_squares

  def initialize
    self.taken_squares = []
    self.board = [
      [1, ' |', 2, ' |', 3],
      ['--', '|', '--', '|', '--'],
      [4, ' |', 5, ' |', 6],
      ['--', '|', '--', '|', '--'],
      [7, ' |', 8, ' |', 9]
    ]
  end

  def choose_square(number)
    return 'square taken' if taken_squares.include?(number)

    board.each do |row|
      row.each_index do |square|
        break if taken_squares.include?(number)

        if row[square] == number
          row[square] = 'x'
          taken_squares << number
        end
      end
    end
  end

  def display
    board.each { |x| puts x.join }
  end
end

# b = Board.new

# p b.choose_square(1)

# b.display
