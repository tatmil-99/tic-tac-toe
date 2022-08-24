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
  def update_board(number)
    return 'square taken' if taken_squares.include?(number)

    board.each do |row|
      row.each_index do |square|
        break if taken_squares.include?(number)

        # base mark (x or o) off of the player requesting the square
        # (player's mark)
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

# p b.update_board(1)

# b.display
