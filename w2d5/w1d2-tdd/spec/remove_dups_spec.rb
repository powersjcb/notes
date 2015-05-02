require 'rspec'
require 'remove_dups'

describe '#remove_dups' do
  let(:empty_array) {[]}
  let(:duped_array) {[1,2,1,2,3,4,5]}
  let(:uniq_array) {[1,2,3,4,5]}
  let(:all_dups) {[1,1,1,1]}

  it "exist in Array class"  do
    expect(empty_array.methods.include?(:remove_dups)).to be(true)
  end

  it "returns empty array when passed empty" do
      expect(empty_array.remove_dups).to eq([])
  end

  it "returns unique array when passed an array with duplicates" do
      expect(duped_array.remove_dups).to eq([1,2,3,4,5])
  end

  it "returns self when no duplicates" do
      expect(uniq_array.remove_dups).to eq(uniq_array)
  end

  it "returns array of length 1 when many duplicates" do
      expect(all_dups.remove_dups.length).to eq(1)
  end
end
