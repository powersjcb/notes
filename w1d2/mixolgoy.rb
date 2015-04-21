class Mixology
  def remix (drinks_and_mixers)
    result = drinks_and_mixers.transpose
    result[0].shuffle
    result[1].shuffle
    result.transpose
  end
end

mixing = Mixology.new

  mixing.remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])
# #=> [["rum, "tonic"], ["gin", "soda"], ["scotch", "coke"]]
