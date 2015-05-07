class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :author_id, null: false
      t.string  :title, null: false

      t.timestamps null: false
    end

    add_index :polls, :author_id
    add_index :polls, :title
    add_index :polls, :created_at
  end
end
