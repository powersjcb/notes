require 'spec_helper'

describe User do
  subject(:joe) { User.first }
  let(:goog) { Company.find_by_name("Google") }
  it "has a watch list" do
    expect(joe.watch_lists.first.name).to eq("big winners")
  end

  it "has watch list items" do
    expect(joe.watch_list_items.first.company_id).to eq(goog.id)
  end

  it "can see watched tickers" do
    expect(joe.watched_companies.first).to eq(goog)
  end
end
