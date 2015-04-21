def towers_of_hanoi(towers)
  p towers
  finished = false
  until finished
    #get from user
    puts "What tower to move from? 0 through #{towers.length - 1}"
    from = gets.to_i
    puts "Where to? 0 through #{towers.length - 1}"
    to = gets.to_i

    if !towers[to].first.nil? && towers[to].first < towers[from].first
      puts "Invalid move. Try another selection."
      next
    end

    towers[to].unshift(towers[from].shift)
    p towers

    #finished?
    if (towers.count { |tower| tower.empty? } == towers.length - 1)
      last = towers.select { |tower| !tower.empty? }
      finished = true if last == last.sort
    end
  end
  puts "you win!"
end

towers = [
  [1,2,3,4],
  [],
  []
]

towers_of_hanoi(towers)
