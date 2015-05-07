# == Schema Information
#
# Table name: watch_list_items
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  start_date    :date
#  end_date      :date
#  watch_list_id :integer
#

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
