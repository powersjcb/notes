class CreateVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits, id: false do |t|
      t.integer :user_id, null: false
      t.integer :shortened_url_id, null: false

      t.datetime :created_at, null: false
    end

    add_index :visits, :user_id
    add_index :visits, :shortened_url_id
    add_index :visits, :created_at
  end
end
