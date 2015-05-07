class AddTagTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :tags do |t|
      t.integer :topic_id, null: false
      t.integer :shortened_url_id, null: false

      t.datetime :created_at, null: false
    end

    add_index :topics, :name, unique: true

    add_index :tags, :topic_id
    add_index :tags, :shortened_url_id
    add_index :tags, [:topic_id, :shortened_url_id], unique: true
  end
end
