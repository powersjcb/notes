class AddSubmitterIdToShortenedUrl < ActiveRecord::Migration
  def change
    add_column :shortened_urls, :submitter_id, :integer, null: false

    add_index :shortened_urls, :submitter_id, name: 'index_on_submitter_id'
  end
end
