# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :watch_lists

  has_many(
    :watch_list_items,
    through: :watch_lists,
    source: :company
  )


  has_many(
    :watched_companies,
    through: :watch_lists,
    source: :watch_list_items
  )

end
