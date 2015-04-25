require 'spec_helper'

describe Company do
  subject(:com) { Company.first }

  it "has a price" do
    expect(com.prices.length).to eq(10)
    com.prices.each do |price|
      expect(price.company_id).to eq(com.id)
    end
  end

  it "has an exchange" do
    expect(com.exchange.name).to eq("NASDAQ")
  end

  it "has a watch list" do
    expect(Company.first.watch_lists.first.name).to eq("big winners")
  end

  it "has a watcher" do
    expect(Company.first.watchers.first.username).to eq("stevej")
  end

  it "has a board" do
    expect(com.board.company_id).to eq(com.id)
  end
end
