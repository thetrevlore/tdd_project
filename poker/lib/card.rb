class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(other_card)
    value == other_card.value && suit == other_card.suit
  end

  def symbol
    numeric_symbols = (2..10).to_a.map(&:to_s)
    face_symbols = ['J', 'Q', 'K', 'A']
    deck_symbols = numeric_symbols + face_symbols
    deck_symbols[value]
  end
end
