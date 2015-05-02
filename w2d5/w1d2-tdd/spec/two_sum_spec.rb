require 'two_sum.rb'
require 'rspec'


describe '#two_sum' do
  let(:empty_array)  { [] }
  let(:non_matching) { [1,2,3,4] }
  let(:matching)     { [1,-1,2,-2] }

  it "exists as an array method" do
    expect(empty_array.methods.include?(:two_sum)).to be(true)
  end

  it "returns an empty array when given empty array" do
    expect(empty_array.two_sum).to eq([])
  end

  it "returns an empty array when no matches" do
    expect(non_matching.two_sum).to eq([])
  end

  it "returns indexes of matches" do
    expect(matching.two_sum).to eq([[0,1],[2,3]])
  end

end
