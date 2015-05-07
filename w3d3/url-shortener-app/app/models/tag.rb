# == Schema Information
#
# Table name: tags
#
#  id               :integer          not null, primary key
#  topic_id         :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#
class Tag < ActiveRecord::Base
  belongs_to(
    :topic,
    class_name: "Topic",
    foreign_key: :topic_id,
    primary_key: :id
  )

  belongs_to(
    :url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

end
