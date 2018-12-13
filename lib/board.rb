# Create & display the grid
# Generate and place the cards

require_relative './card.rb'

class Board
  CARDS = %w[1 2 3 4 5 6 7 8 9 10 J Q K A].product(%w[C S D H]).map(&:join)

  def initialize(size)
    @size = valid_size(size)
    @all_cards = []
    populate
  end

  def valid_size(size)
    unless size.even?
      size += 1
      puts "Board size updated to #{size}. Card count must be even."
    end
    size
  end

  def choose_cards
    num_unique = @size**2 / 2
    cards = CARDS.sample(num_unique) * 2
    cards.shuffle!
  end

  def populate
    cards = choose_cards
    row = []
    cards.each_with_index do |card, idx|
      row << card
      if ((idx + 1) % @size).zero?
        @all_cards << row
        row = []
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new(3)
end
