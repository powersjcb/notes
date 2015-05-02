def stock_picker(prices)
  best_days = []
  best_profits = 0
  prices.each_with_index do |buy_price, buy_day|
    prices.drop(buy_day).each_with_index do |sell_price, holding_time|
      if sell_price - buy_price > best_profits
        best_days = [buy_day, buy_day + holding_time]
        best_profits = sell_price - buy_price
      end
    end
  end

  best_days
end
