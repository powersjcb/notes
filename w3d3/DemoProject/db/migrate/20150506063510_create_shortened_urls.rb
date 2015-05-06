class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.text   :long_url, limit: 1023, null: false
      t.string :short_url, null: false

      t.timestamps null: false
    end
  end
end
