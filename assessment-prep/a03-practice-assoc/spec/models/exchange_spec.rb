# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Exchange do
  subject(:nyse) { Exchange.first }

  it "has a company" do
    expect(nyse.companies.first.name).to eq("Google")
  end
end
