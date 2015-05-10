# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base
end
