require 'set'
require 'byebug'
#push vs pop
#     shift <- | | -> pop
#
#   unshift -> | | <- push
#


class Array
  def my_uniq
    inject { |c,el| c << el unless c.include?(el) }
  end

  def two_sum
    pairs = []
    count.times do |i1|
      (i1 + 1).upto(self.count-1) do |i2|
        pairs << [i1,i2] if self[i1] + self[i2] == 0
      end
    end

    pairs
  end

end
def my_transpose(rows)
  dimension = rows.first.count
  cols = Array.new(dimension) { Array.new(dimension) }

  dimension.times do |i|
    dimension.times do |j|
      cols[j][i] = rows[i][j]   #BE SURE TO USE [x][y][z] syntax
    end
  end

  cols
end

# p my_transpose([[1,2,3],[4,5,6],[7,8,9]])

def stock_picker(prices)
  best_pair = nil
  best_profit = 0

  prices.each_with_index do |buy_date|
    prices.each_with_index do |sell_date|
      next if buy_date > sell_date

      profit = prices[sell_date] - prices[buy_date]
      if profit > best_profit
        best_pair, best_profit = [buy_date, sell_date], profit
      end
    end
  end
  best_pairs
end

class Array
  def bubble_sort
    self.dup.bubble_sort!
  end


  def bubble_sort!
    sorted = false
    until sorted
      sorted = true

      self.each_index do |i|
        next if i + 1 == self.length

        if self[i] > self[i+1]
          self[i+1], self[i] = self[i], self[i+1]
          sorted = false
        end
      end
    end

    self
  end
end
