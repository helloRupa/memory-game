# First guess = random pair choice
# Store guess results and make matches when found

# require_relative './board.rb'

class ComputerPlayer
  def initialize(size)
    @size = size
    @guesses = []
    @guess_pair = []
    @board = []
  end

  def receive_board(board)
    @board = board
  end

  def make_guess
    pause
    puts 'Computer is thinking...'
    guess = matches_in_guesses || valid_random_guess
    update_guess_arrays(guess)
    puts "Guess is #{guess[0]}, #{guess[1]}"
    # puts "Guess pair is #{@guess_pair}"
    puts "Guesses is #{@guesses}"
    pause
    guess
  end

  def update_guess_arrays(guess)
    @guess_pair << guess
    if @guess_pair.length == 2
      if @board.match?(@guess_pair)
        @guesses.delete(@guess_pair[0])
        @guesses.delete(@guess_pair[1])
      else
        @guesses << @guess_pair[0] unless @guesses.include?(@guess_pair[0])
        @guesses << @guess_pair[1] unless @guesses.include?(@guess_pair[1])
      end
      @guess_pair = []
    end
  end

  def matches_in_guesses
    if @guess_pair.empty?
      @guesses.each do |coords|
        if @guesses.count(@board[*coords].value) > 1
          @guesses.delete(coords)
          return coords
        end
      end
    else
      @guesses.each do |coords|
        next if coords == @guess_pair[0]
        if @board.match?([coords, @guess_pair[0]])
          @guesses.delete(coords)
          return coords
        end
      end
    end
    nil
  end

  def pause
    sleep(5)
  end

  def random_guess
    [rand(@size), rand(@size)]
  end

  def valid_random_guess
    x, y = random_guess
    while @board[x, y].face_up
      x, y = random_guess
    end
    [x, y]
  end
end
