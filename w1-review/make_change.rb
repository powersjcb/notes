def make_change(val,coins=[25,10,5,1])
  return [ ] if val / coins.min == 0


  coins.each do |coin|
    return [coin] + make_change(val-coin, coins) if val / coin > 0
  end

end

# p make_change(35)
