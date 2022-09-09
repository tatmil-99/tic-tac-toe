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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def three_in_a_row?
    winning_patterns = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]

    winning_patterns.each do |pattern|
      values = taken_squares.fetch_values(*pattern) { |key| key }

      break if @three_in_a_row == true

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
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity
end
