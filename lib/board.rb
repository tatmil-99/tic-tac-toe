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

  def choose_square(number)
    # board.each do |row|
    #   square_index = row.index(number)
    #   break square_index unless square_index.nil?
    # end

    board.each do |row|
      row.each_index do |square|
        row[square] = 'x' if row[square] == number
      end
    end
  end
end

b = Board.new

b.choose_square(1)

b.display
