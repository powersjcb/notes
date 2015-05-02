class Array
  def two_sum
    pairs = []

    each.with_index do |el1, i1|
      self.drop(i1).each.with_index do |el2, i2|
        pairs << [i1, (i2+i1)] if el1 + el2 == 0
      end
    end
    pairs
  end
end
