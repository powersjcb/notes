require 'date'
# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  color       :string           not null
#  name        :string
#  sex         :string(1)
#  description :text             not null
#  birth_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  validates(
    :name, :sex, :description, :birth_date, :color,
      presence: true,
      allow_blank: false
  )

  validates_inclusion_of :sex, in: ['M', 'F']
  validates_inclusion_of :color in: ["callico", 'black', 'white']


  def self.age
    
  end

end
