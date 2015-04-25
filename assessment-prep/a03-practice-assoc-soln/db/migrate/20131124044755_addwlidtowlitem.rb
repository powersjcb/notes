class Addwlidtowlitem < ActiveRecord::Migration
  def change
    add_column :watch_list_items, :watch_list_id, :integer
  end

  def down
  end
end
