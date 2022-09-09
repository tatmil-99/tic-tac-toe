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

  # Create an array with all winning patterns ([[1, 2, 3], ...]) as sub-array
  # Iterate through array, then
  # Fetch key values in each sub-array and store in values array, then
  # If all values in values array are 'x' or 'o', then
  # Set instance variable to true
  # Else set instance variable to false

  # rubocop:disable Metrics/MethodLength
  def three_in_a_row?
    winning_patterns = [[1, 2, 3]]

    winning_patterns.each do |pattern|
      values = taken_squares.fetch_values(*pattern) { |key| key }

      @three_in_a_row = if values.all? { |val| val == 'x' }
                          true
                        elsif values.all? { |val| val == 'o' }
                          true
                        else
                          false
                        end
    end

    @three_in_a_row
  end
  # rubocop:ensable Metrics/MethodLength

  def winner; end
end

b = Board.new

b.update(1, 'o')
b.update(2, 'o')
b.update(3, 'x')

p b.three_in_a_row?

p b.taken_squares

# puts b.display
