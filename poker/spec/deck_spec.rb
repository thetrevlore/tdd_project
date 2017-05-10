require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  context "when initialized" do
    it "has an array of 52 unique cards" do
      expect(deck.cards.uniq.size).to eq(52)
    end
  end

  describe '#deal' do
    it "takes an integer" do
      expect(deck.deal(3)).to be_truthy
      expect { deck.deal(53) }.to raise_error(ArgumentError)
    end

    it "returns an array of cards with length equal to the argument" do
      cards = deck.deal(3)
      expect(cards.first.is_a?(Card)).to be true
      expect(cards.count).to eq(3)
    end

    it "removes dealt cards from deck" do
      expect(deck.cards.count).to eq(52)
      cards = deck.deal(3)
      expect(deck.cards.count).to eq(49)
    end

    it "doesn't deal cards that have already been dealt" do
      huge_hand = deck.deal(52)
      expect(huge_hand).to eq(huge_hand.uniq)
    end
    
  end

end
