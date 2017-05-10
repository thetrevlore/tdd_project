class Array
  def my_uniq
    a_uniq = []

    self.each do |el|
      a_uniq << el unless a_uniq.include?(el)
    end

    a_uniq
  end

  def two_sum
    pairs = []

    each_index do |i|
      (i+1...length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end

end

def my_transpose(matrix)
  transposed = []

  matrix.length.times do |i|
    column = []

    matrix.each do |row|
      column << row[i]
    end

    transposed << column
  end

  transposed
end

def stock_picker(prices)
  raise ArgumentError if prices.length < 2

  largest_profit_pair = [0, 1]
  largest_profit = prices[1] - prices[0]

  prices.each_with_index do |buy_price, buy_i|

    (buy_i+1...prices.length).each do |sell_i|
      sell_price = prices[sell_i]
      profit = sell_price - buy_price

      if profit > largest_profit
        largest_profit_pair = [buy_i, sell_i]
        largest_profit = profit
      end
    end
  end

  largest_profit_pair
end

class TowersOfHanoi
  attr_accessor :discs

  def initialize
    @discs = [[3, 2, 1], [], []]
  end

  def move(from, to)
    if valid_move?(from, to)
      discs[to] << discs[from].pop
    end
  end

  def play
    move(gets.chomp.to_i, gets.chomp.to_i) until won?
  end

  def won?
    discs[1].size == 3 || discs[2].size == 3
  end

  private

  def valid_move?(from, to)
    unless [from,to].all? {|pile| pile.between?(0,2)}
      raise 'Both numbers must be between 0 and 2'
    end
    raise 'There are no discs at that pile' if discs[from].empty?
    unless discs[to].empty? || discs[from].last < discs[to].last
      raise 'Cannot move larger disc onto smaller disc'
    end

    true
  end
end
