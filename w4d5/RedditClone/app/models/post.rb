# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string           not null
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base

  include Commentable

  belongs_to :sub
  belongs_to :author, class_name: "User", foreign_key: :author_id
  validates :title, :content, :sub_id, :author_id, presence: true
  validates :url, length: { maximum: 1023, allow_nil: true }

  before_save :fix_url

  def fix_url
     self.url = (url && url.length >= 4) ? url : nil
  end
end
