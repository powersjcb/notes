class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :moderator_id, null: false

      t.timestamps null: false
    end

    add_index :subs, :title, unique: true
    add_index :subs, :moderator_id
  end
end
