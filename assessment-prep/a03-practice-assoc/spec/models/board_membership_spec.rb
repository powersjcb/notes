# == Schema Information
#
# Table name: board_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  board_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe BoardMembership do
  subject(:membership) { BoardMembership.first }

  it "has a board" do
    goog_id = Company.find_by_name("Google").id
    expect(membership.board.company_id).to eq(goog_id)
  end

  it "has a member" do
    expect(membership.member.name).to eq("Larry Page")
  end
end
