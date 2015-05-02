require 'byebug'
class TowersOfHanoi
  attr_reader :stacks
  def initialize
    @stacks = Array.new(3) {[]}
    populate_disc
  end

  def move_disc(start, finish)
    raise unless valid_move?(start, finish)
    @stacks[finish].unshift(@stacks[start].shift)
  end

  def won?
    if @stacks.drop(1).any? { |stack| stack.length == 4}
      true
    else
      false
    end
  end


  private
  def valid_move?(pick, place)
    !@stacks[pick].empty? && (@stacks[place].empty? ||
        @stacks[place][0] > @stacks[pick][0])
  end

  def populate_disc
    @stacks[0] = [1,2,3,4]
  end
end
