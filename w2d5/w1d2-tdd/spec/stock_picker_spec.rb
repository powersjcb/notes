require 'rspec'
require 'stock_picker'

describe '#stock_picker' do
  let(:good_day)    {[0,1,1,2,10,5,2]}
  let(:bad_day)     {[10,5,4,3,2,1]}
  let(:invalid_day) {[]}


  it "should return highest pair for good day" do
    expect(stock_picker(good_day)).to eq([0,4])
  end


  it "should return empty for a terrible day" do
    expect(stock_picker(bad_day)).to eq([])
  end

  it "should return empty if not given any prices" do
    expect(stock_picker(invalid_day)).to eq([])
  end




end
