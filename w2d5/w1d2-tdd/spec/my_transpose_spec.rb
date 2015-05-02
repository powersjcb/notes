require 'rspec'
require 'my_transpose'

describe "#my_transpose" do
  let(:square_array) { [[1,2,3],[4,5,6], [7,8,9]]}
  let(:row_array) { [[1,2,3]]}
  let(:empty_array) {[]}

  it "exist in Array class"  do
    expect(empty_array.methods.include?(:my_transpose)).to be(true)
  end

  it "transposes correctly" do
    expect(square_array.my_transpose).to eq([[1,4,7],[2,5,8], [3,6,9]])
  end

  it "transposes a single row" do
      expect(row_array.my_transpose).to eq([[1], [2], [3]])
  end

end
