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

class Toy < ActiveRecord::Base
  belongs_to :pokemon

  validates :happiness, :image_url, :name, :pokemon, :price, presence: true
  validates :happiness, :price, numericality: true
end
