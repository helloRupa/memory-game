# Create & display the grid
# Generate and place the cards

require_relative './card.rb'

class Board
  CARDS = %w[1 2 3 4 5 6 7 8 9 10 J Q K A].product(%w[C S D H]).map(&:join)
  SPACE_BETWEEN_CARDS = 5

  def initialize(size)
    @size = valid_size(size)
    @board = []
    populate
    render
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
      row << Card.new(card)
      if ((idx + 1) % @size).zero?
        @board << row
        row = []
      end
    end
  end

  def print_header_row
    header = (0...@size).to_a
    puts '   ' + header.join('    ')
  end

  def print_card_row(row)
    @board[row].each do |card|
      if card.face_up
        print card.value
        spaces = SPACE_BETWEEN_CARDS - card.value.length
        print ' ' * spaces
      else
        print ' ' * SPACE_BETWEEN_CARDS
      end
    end
  end

  def render
    print_header_row
    @size.times do |row|
      print "#{row} "
      print_card_row(row)
      puts
    end
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new(3)
end
