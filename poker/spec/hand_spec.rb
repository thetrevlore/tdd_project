require 'hand'

describe Hand do
  let(:ace) {double("Ace", value: 12, suit: :spades)}
  let(:king1) {double("King1", value: 11, suit: :spades)}
  let(:king2) {double("King2", value: 11, suit: :hearts)}
  let(:king3) {double("King3", value: 11, suit: :clubs)}
  let(:king4) {double("King4", value: 11, suit: :diamonds)}
  subject(:hand) { Hand.new(ace, king1, king2, king3, king4)}

  describe '#cards' do
    it 'returns a five card hand' do
      expect(hand.cards).to eq(ace, king1, king2, king3, king4)
    end
  end

  describe '#high_card' do
    it 'returns the card with the highest value' do
      expect(hand.high_card).to eq(ace)
    end
  end

  describe '#pair' do
    it 'returns two cards with equal values if possible'
    it 'returns nil if all cards have differet values'
  end

  describe '#two_pair' do
    it 'returns two pairs of cards if there are two pairs'
    it 'returns nil if there are fewer than two pairs'
  end

  describe '#three_of_a_kind' do
    it 'returns three cards with equal values if possible'
    it 'returns nil if fewer than three cards have equal values'
  end

  describe '#straight' do
    it 'returns the hand if all cards have consecutive values'
    it 'returns nil if any card value is not consecutive'
  end

  describe '#flush' do
    it 'returns the hand if all cards have the same suit'
    it 'returns nil if any card has a different suit'
  end

  describe '#full_house' do
    it 'returns the hand if there is a three of a kind and pair with different values'
    it 'returns nil otherwsie'
  end

  describe '#four_of_a_kind' do
    it 'returns four cards with equal values if possible'
    it 'returns nil if not possible'
  end

  describe '#straight_flush' do
    it 'returns the hand if it is both a straight and flush'
    it 'returns nil otherwise'
  end

  describe '#<=>' do
    it 'compares hands by strength heirarchy'
  end

end
