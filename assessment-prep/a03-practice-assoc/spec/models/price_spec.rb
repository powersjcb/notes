# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  company_id :integer
#  open       :float
#  high       :float
#  low        :float
#  close      :float
#  price_date :date
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Price do
  subject(:price) { Price.first }

  it "has a company" do
    expect(price.company.name).to eq("Google")
  end
end
