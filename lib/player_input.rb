# handle user input from the command line
class PlayerInput
  attr_reader :mark

  def query_mark
    puts 'Choose "x" or "o":'
    @mark = gets.chomp.downcase
  end
end
