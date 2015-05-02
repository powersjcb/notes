class Array
  def remove_dups
    uniqs = []

    each do |el|
      uniqs << el unless uniqs.include?(el)
    end

    uniqs
  end
end
