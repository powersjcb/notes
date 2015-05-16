class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
    add_index(
      :comments,
      [:user_id, :commentable_id, :commentable_type],
      name: :unique_comments,
      unique: true
    )
  end
end
