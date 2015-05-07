# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :text             not null
#  short_url    :string           not null
#  submitter_id :integer          not null
#

class ShortenedUrl < ActiveRecord::Base
  validates(
    :long_url,
    length: { maximum: 1023 },
    presence: true,
    allow_blank: false
  )

  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id
  )

  has_many(
    :tags,
    class_name: "Tag",
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: "shortened_url_id",
    primary_key: "id"
  )

  has_many(
    :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor
  )

  has_many(
    :topics,
    -> { distinct },
    through: :tags,
    source: :topic
  )

  def self.create_for_user_and_long_url(user, long_url)
    ShortenedUrl.create!(long_url: long_url,
                         short_url: ShortenedUrl.random_code,
                         submitter: user)
  end

  def self.random_code
    new_url = SecureRandom::urlsafe_base64
    until !self.exists?(short_url: new_url)
      new_url = SecureRandom::urlsafe_base64
    end

    new_url
  end


  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    # self
    #   .visits
    #   .select('COUNT(DISTINCT(user_id)) as visit_count')
    #   .where("visits.created_at" => (1000.minutes.ago..Time.now))
    #   .first

    self
      .visits
      .where("created_at" => (15.minutes.ago..Time.now))
      .group("user_id")
      .count
      .values.first || 0
  end
end
