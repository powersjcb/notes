# == Schema Information
#
# Table name: toys
#
#  id         :integer          not null, primary key
#  pokemon_id :integer          not null
#  name       :string(255)      not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Toy, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
