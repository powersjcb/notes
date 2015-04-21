class Array
  def stock_picker
    highest_profit = 0
    highest_days = []
    self.each_with_index do |price1, index_start|
      ((index_start + 1)..(self.length - 1)).each do |index_final|
        profit = self[index_final] - price1
        if profit > highest_profit
          highest_profit = profit
          highest_days = [index_start, index_final]
        end
      end
    end

    highest_days
  end
end

p [1, 3, 10, 2, -4, 9].stock_picker == [4, 5]
