require_relative 'card'

class Deck
  attr_reader :cards

  def self.shuffled_cards
    cards = []

    [:hearts, :diamonds, :spades, :clubs].each do |suit|
      (0..13).each do |value|
        cards << Card.new(value, suit)
      end
    end

    cards.shuffle
  end

  def initialize(cards = Deck.shuffled_cards)
    @cards = cards
  end

  def deal(num_of_cards)
    # new_hand = []
    #
    # until new_hand.count == num_of_cards
    #   card = cards.sample
    #   unless used_cards.include?(card)
    #     new_hand << card
    #     @used_cards << card
    #   end
    # end
    #
    # new_hand = cards.reject { |card| used_cards.include?(card) }.sample(num_of_cards)
    #
    # @used_cards += new_hand
    # new_hand
    raise ArgumentError if num_of_cards > cards.count
    cards.pop(num_of_cards)
  end
end
