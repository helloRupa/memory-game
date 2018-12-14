# First guess = random pair choice
# Store guess results and make matches when found

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
    pause
    guess
  end

  def update_guess_arrays(guess)
    @guess_pair << guess
    return nil unless @guess_pair.length == 2
    if @board.match?(@guess_pair)
      @guesses.delete(@guess_pair[0])
      @guesses.delete(@guess_pair[1])
    else
      @guesses << @guess_pair[0] unless @guesses.include?(@guess_pair[0])
      @guesses << @guess_pair[1] unless @guesses.include?(@guess_pair[1])
    end
    @guess_pair = []
  end

  def matches_in_guesses
    find_match_in_guesses || find_match_in_guesses_and_guess_pair
  end

  def find_match_in_guesses_and_guess_pair
    return nil if @guess_pair.empty?
    @guesses.each do |coords|
      next if coords == @guess_pair[0]
      if @board.match?([coords, @guess_pair[0]])
        @guesses.delete(coords)
        return coords
      end
    end
    nil
  end

  def find_match_in_guesses
    return nil unless @guess_pair.empty?
    @guesses.each do |coords|
      if @guesses.count(@board[*coords].value) > 1
        @guesses.delete(coords)
        return coords
      end
    end
    nil
  end

  def pause
    sleep(2)
  end

  def random_guess
    [rand(@size), rand(@size)]
  end

  def valid_random_guess
    x, y = random_guess
    x, y = random_guess while @board[x, y].face_up
    [x, y]
  end
end
