require 'card'

describe Card do
  subject(:card) { Card.new(12, :spades) }

  context "when initalized" do
    it "has a value" do
      expect(card.value).to eq(12)
    end

    it "has a suit" do
      expect(card.suit).to eq(:spades)
    end
  end

  describe '#==' do
    context 'when comparing two cards with the same value and suit' do
      it 'returns true' do
        compare_card = Card.new(12, :spades)
        expect(card == compare_card).to be true
      end
    end

    context 'when comparing two cards with different values or suits' do
      it 'returns false' do
        diff_suit = Card.new(12, :hearts)
        diff_value = Card.new(11, :spades)
        expect(diff_suit == card).to be false
        expect(diff_value == card).to be false
      end
    end
  end

  describe '#symbol' do
    it 'returns the symbol representing card value' do
      expect(card.symbol).to eq('A')
      expect(Card.new(0, :spades).symbol).to eq('2')
    end
  end
end
