require 'spec_helper'

describe Exchange do
  subject(:nyse) { Exchange.first }

  it "has a company" do
    expect(nyse.companies.first.name).to eq("Google")
  end
end
