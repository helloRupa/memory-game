# Prompt player for input and get response

class Player
  def initialize(size)
    @size = size
  end

  def make_guess
    puts 'Enter the x,y coordinates for a card. Example: 0, 3'
    valid_guess(gets.chomp)
  end

  def receive_board(board)
    # Duck duck quack
  end

  private

  def valid_guess(guess)
    x, y = format_guess(guess)
    until (0...@size).cover?(x) && (0...@size).cover?(y)
      puts 'Please enter valid coordinates, such as 2, 3'
      guess = gets.chomp
      x, y = format_guess(guess)
    end
    [x, y]
  end

  def format_guess(guess)
    guess.delete!(' ')
    guess.split(',').map(&:to_i)
  end
end

if $PROGRAM_NAME == __FILE__
  player = Player.new(4)
  p player.make_guess
end