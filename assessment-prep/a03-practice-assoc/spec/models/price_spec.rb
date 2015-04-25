require 'spec_helper'

describe Price do
  subject(:price) { Price.first }

  it "has a company" do
    expect(price.company.name).to eq("Google")
  end
end
