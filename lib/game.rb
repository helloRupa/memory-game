# Start and run the game

require_relative './board.rb'
require_relative './human_player.rb'

class Game
  def initialize(size, player)
    @board = Board.new(size)
    @player = player.new(size)
    @guess_pair = []
    welcome
    play
  end

  def welcome_message
    puts
    puts 'Welcome to the Match 2 Memory Game!'
    puts
    puts 'To win find all of the matching cards.'
  end

  def welcome
    # system('clear')
    welcome_message
    sleep(2)
  end

  def show_board
    @board.render
  end

  def play
    # system('clear')
    until win?
      show_board
      turn
    end
  end

  def turn
    @guess_pair = []
    process_guess
    show_board
    process_guess
  end

  def process_guess
    guess = valid_guess
    x, y = guess
    @board[x, y].show
    @guess_pair << guess
  end

  def valid_guess
    x, y = @player.make_guess
    while @board[x, y].face_up
      puts 'Please choose a card that is face down'
      x, y = @player.make_guess
    end
    [x, y]
  end

  def win?
    @board.board_complete?
  end
end

if $PROGRAM_NAME == __FILE__
  Game.new(4, Player)
end