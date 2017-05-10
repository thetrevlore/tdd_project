require 'tdd'

describe Array do
  describe "#my_uniq" do
    context "When array has no duplicates" do
      it "returns original array" do
        array = [1, 2, 3]
        expect(array.my_uniq).to eq(array)
      end
    end

    context "When array has duplicates" do
      it "returns array with no duplicates" do
        array = [1, 2, 1, 3, 3]
        expect(array.my_uniq).to eq([1, 2, 3])
      end

      it "does not modify original array" do
        array = [1, 2, 1, 3, 3]
        dup = array.dup
        array.my_uniq
        expect(array).to eq(dup)
      end
    end
  end

  describe '#two_sum' do
    context "When no two elements sum to zero" do
      it "returns an empty array" do
        expect([1, 2, 3].two_sum).to eq([])
      end
    end

    context "When two elements sum to zero" do
      it "returns an array containing an array of the two elements' indices" do
        expect([1, -1, 2].two_sum).to eq([[0, 1]])
      end
    end

    context "When multiple pairs sum to zero" do
      it "returns an array of the index pairs in sorted order" do
        array = [-1, 0 , 2, -2, 1]

        expect(array.two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end

end

describe '#my_transpose' do
  context 'when passed a small square matrix' do
    it "returns a matrix with the columns and rows reversed" do
      matrix = [[0, 1], [2, 3]]
      expect(my_transpose(matrix)).to eq([[0, 2], [1, 3]])
    end
  end

  context "when passed a large square matrix" do
    let(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    let(:cols) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }

    it "returns a matrix with the columns and rows reversed" do
      expect(my_transpose(rows)).to eq(cols)
    end

    it "does not modify the original array" do
      dup = rows.dup
      my_transpose(rows)
      expect(rows).to eq(dup)
    end
  end
end

describe '#stock_picker' do
  context "when argument is an array of less than 2 elements" do
    it "raises an error" do
      expect { stock_picker([1])}.to raise_error(ArgumentError)
    end
  end
  context "when argument is an array of two elements" do
    it "returns their indices" do
      expect(stock_picker([3, 1])).to eq([0, 1])
    end
  end

  context "when argument has more than two elements" do
    context "when a later price exceeds earlier price" do
      it "returns the indices of the largest profit" do
        array1 = [0, 3, 10]
        array2 = [10, 1, 5, 9, 0]
        expect(stock_picker(array1)).to eq([0, 2])
        expect(stock_picker(array2)).to eq([1, 3])
      end
    end

    context "when prices are in decreasing order" do
      it "returns the indices of the smallest loss" do
        unprofitable_array = [9, 7, 2, 1]
        expect(stock_picker(unprofitable_array)).to eq([2,3])
      end
    end
  end
end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  context "when the game starts" do
    it "should initialize with an array of discs" do
      expect(game.discs).to eq([[3, 2, 1], [], []])
    end
  end

  describe '#move' do
    context "when given a pile to move from and to" do
      it "moves a disc" do
        game.move(0, 1)
        expect(game.discs).to eq([[3, 2], [1], []])
      end
    end

    context "when given an argument out of range" do
      it "raises an error" do
        expect { game.move(0, 5) }.to raise_error('Both numbers must be between 0 and 2')
        expect { game.move(5, 0) }.to raise_error('Both numbers must be between 0 and 2')
      end
    end

    context "when trying to move from an empty pile" do
      it "raises an error" do
        expect { game.move(1, 2) }.to raise_error('There are no discs at that pile')
      end
    end

    context "when trying to move larger disc onto smaller disc" do
      it "raises an error" do
        game.move(0, 1)
        expect { game.move(0, 1) }.to raise_error('Cannot move larger disc onto smaller disc')
      end
    end

  end

  describe '#won?' do
    context 'when the game is won' do
      it 'returns true' do
        game.discs[0], game.discs[1] = game.discs[1], game.discs[0]
        expect(game.discs).to eq([[], [3, 2, 1], []])
        expect(game.won?).to be true
      end
    end

    context 'when the game has not yet been won' do
      it 'returns false' do
        expect(game.won?).to be false
      end
    end
  end

end




#
