# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string(255)      not null
#  moves      :string(255)      not null
#  image_url  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Pokemon < ActiveRecord::Base
  TYPES = [
    "fire",
    "electric",
    "normal",
    "ghost",
    "psychic",
    "water",
    "bug",
    "dragon",
    "grass",
    "fighting",
    "ice",
    "flying",
    "poison",
    "ground",
    "rock",
    "steel"
  ].sort

  serialize :moves, Array

  has_many :toys

  validates :attack, :defense, :image_url, :name, :moves, :poke_type, presence: true
  validates :attack, :defense, numericality: true
  validates :poke_type, inclusion: { in: TYPES }
end
