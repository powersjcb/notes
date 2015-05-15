class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|

      t.string :link, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :links, :link
    add_index :links, :user_id
  end
end
