class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content, null: false
      t.integer :sub_id, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end

    add_index :posts, :title
    add_index :posts, :sub_id
    add_index :posts, :author_id
    add_index :posts, [:title, :url, :content, :sub_id, :author_id], name: 'entire_repost_index', unique: true
  end
end
