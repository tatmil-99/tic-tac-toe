class Board
  attr_accessor :board, :taken_squares

  def initialize
    @full = false
    self.taken_squares = {}
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

  def update(number, letter)
    board.each do |row|
      row.each_index do |square|
        next row[square] unless row[square].is_a?(Integer) &&
                                row[square] == number

        row[square] = letter
        taken_squares[number] = letter
      end
    end
  end

  def display
    board.each { |row| puts row.join }
  end

  def three_in_a_row?
    # squares = taken_squares.map(&:values)
    #                        .flatten
    #                        .keep_if { |x| x.is_a?(Integer) }
  end

  def winner; end
end

# b = Board.new

# b.update(1, 'x')

# p b.taken_squares

# puts b.display
