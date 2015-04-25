require 'spec_helper'

describe WatchListItem do
  subject(:wl_item) { WatchListItem.first }

  it "has a watchlist" do
    expect(wl_item.watch_list.name).to eq("big winners")
  end

  it "has a company" do
    expect(wl_item.company.name).to eq("Google")
  end
end
