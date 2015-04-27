class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |n1, n2| n1 <=> n2 }
    return self if size < 2

    Array.merge(
      self.take(size/2).merge_sort(&prc),
      self.drop(size/2).merge_sort(&prc),
      &prc)
  end

  private
  #two finger algorithm
    def self.merge(left,right,&prc)
      prc ||= Proc.new { |n1,n2| n1 <=> n2 }
      merged = []
      until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when 1
          merged << right.shift
        when 0
          merged << [left,right].sample.shift
        when -1
          merged << left.shift
        end
      end

      merged + left + right
    end
end


p [12,223,3,4,5].merge_sort
