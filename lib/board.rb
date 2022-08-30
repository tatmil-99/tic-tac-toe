class Board
  attr_accessor :board, :taken_squares

  def initialize
    @full = false
    self.taken_squares = []
    self.board = [
      [1, ' |', 2, ' |', 3],
      ['--', '|', '--', '|', '--'],
      [4, ' |', 5, ' |', 6],
      ['--', '|', '--', '|', '--'],
      [7, ' |', 8, ' |', 9]
    ]
  end

  def full?
    if taken_squares.length == 9
      @full = true
    else
      @full
    end
  end

  # square selected by player object
  # may be able to pass a hash ({mark:square}) as number argument
  def update(number)
    return 'square taken' if taken_squares.include?(number)

    board.each do |row|
      row.each_index do |square|
        next row[square] unless row[square].is_a?(Integer)

        if row[square] == number
          row[square] = 'x'
          taken_squares << number
        end
      end
    end
  end

  def display
    board.each { |row| puts row.join }
  end
end

# b = Board.new

# b.update_board(1)

# puts taken_squares

# puts b.display
