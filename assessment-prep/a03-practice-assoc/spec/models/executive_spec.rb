# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Executive do
  subject(:larry) { Executive.first }
  
  let(:goog_board) do
    goog_id = Company.find_by_name("Google").id
    Board.find_by_company_id(goog_id)  
  end
  
  it "has a membership" do
    expect(larry.memberships.first.board_id).to eq(goog_board.id)
  end

  it "is on a board" do
    expect(larry.boards.first).to eq(goog_board)
  end
end
