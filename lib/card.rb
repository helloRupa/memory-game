# Card's have a value (e.g. A or King of Hearts), which is determined by controller
# Each card tracks whether it is hidden or showing, and acts accordingly

class Card
  attr_reader :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def show
    @face_up = true
  end
end

if $PROGRAM_NAME == __FILE__
  card = Card.new('A')
  card.hide
  puts "I tried to hide. Card is showing: #{card.face_up}"
  card.show
  puts "I tried to show. Card is showing: #{card.face_up}"
end