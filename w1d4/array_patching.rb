require 'byebug'
class Array
  def my_each(&block)
    i = 0
    while i < self.length
      block.call(self[i])
      i += 1
    end
  end

  def my_map(&block)
    array = []
    my_each do |el|
      array << block.call(el)
    end

    array
  end

  def my_select(&block)
    array = []
    my_each do |el|
      array << el if block.call(el)
    end

    array
  end

  def my_inject(&block)
    array = self.dup
    collector = array.shift
    array.my_each do |el|
      collector = block.call(collector, el)
    end

    collector
  end
end



if __FILE__ == $PROGRAM_NAME
  # a = "before"
  proc = Proc.new {|el| puts el}
  # a = "after"
  p a.object_id
  array = [1,2,3]
  # array.my_each { |el| puts el }
  array.my_each(&proc)
  # .each {}
  p array.map(&:to_s)
  p array.my_inject {|c, el| c += el} == 6
end
