class Board
  attr_accessor :board, :taken_squares

  def initialize
    @full = false
    @three_in_a_row = false
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
    # if taken_squares.length == 9
    #   @full = true
    # else
    #   @full
    # end

    @full = taken_squares.length == 9
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
    values = taken_squares.fetch_values(1, 2, 3) { |key| key }

    @three_in_a_row = if values.all? { |val| val == 'x' }
                        true
                      elsif values.all? { |val| val == 'o' }
                        true
                      else
                        false
                      end
  end

  def winner; end
end

b = Board.new

b.update(1, 'o')
b.update(2, 'o')
b.update(3, 'x')

p b.three_in_a_row?

p b.taken_squares

# puts b.display
