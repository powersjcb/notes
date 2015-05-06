# == Schema Information
#
# Table name: visits
#
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#

class Visit < ActiveRecord::Base
  validates :user_id, null: false
  validates :shortened_url_id, null: false

  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :visited_url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id
  )


  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor: user, visited_url: shortened_url)
  end




end
