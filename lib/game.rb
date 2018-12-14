# Start and run the game

require_relative './board.rb'
require_relative './human_player.rb'

class Game
  def initialize(size, player)
    @board = Board.new(size)
    @player = player.new(size)
    welcome
  end

  def welcome_message
    puts
    puts 'Welcome to the Match 2 Memory Game!'
    puts
    puts 'To win find all of the matching cards.'
  end

  def welcome
    system('clear')
    welcome_message
    sleep(2)
  end
end

if $PROGRAM_NAME == __FILE__
  Game.new(4, Player)
end