# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :text             not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, length: { maximum: 255 }
  validates :long_url,  presence: true, length: { maximum: 1023 }

  has_one :shorten_url, class_name: "ShortenedURL",
                        foreign_key: "long_url"

  belongs_to :long_url, class_name: "ShortenedURL",
                        foreign_key: "short_url"

    before_save

private

  def shorten_url
    @short_url = SecureRandom::urlsafe_base64
  end


end
