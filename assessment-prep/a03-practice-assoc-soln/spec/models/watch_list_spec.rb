require 'spec_helper'

describe WatchList do
  subject(:wl) { WatchList.first }

  it "has a user" do
    steve = User.find_by_username("stevej")
    expect(wl.user).to eq(steve)
  end

  it "has a watch list item" do
    goog_id = Company.find_by_name("Google").id
    watch_goog = WatchListItem.find_by_company_id(goog_id)
    expect(wl.watch_list_items.first).to eq(watch_goog)
  end
end
