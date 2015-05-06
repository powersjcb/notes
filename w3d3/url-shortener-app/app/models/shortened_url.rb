# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  long_url  :text             not null
#  short_url :string           not null
#

class ShortenedUrl < ActiveRecord::Base
  def self.random_code
    new_url = SecureRandom::urlsafe_base64
    until !self.exists?(short_url: new_url)
      new_url = SecureRandom::urlsafe_base64
    end

    new_url
  end

  def self.create_for_user_and_long_url(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url:
                        ShortenedUrl.create_for_user_and_long_url )

      # #create!(user, shortened_url_id)
  end
end
