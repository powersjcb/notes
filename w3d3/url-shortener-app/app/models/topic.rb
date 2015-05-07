# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  has_many(
    :tags,
    class_name: "Tag",
    foreign_key: :topic_id,
    primary_key: :id
  )

  has_many(
    :urls,
    -> { distinct },
    through: :tags,
    source: :url
  )

end
