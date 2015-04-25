class AddStartEndDatesToWlItems < ActiveRecord::Migration
  def change
    add_column :watch_list_items, :start_date, :date
    add_column :watch_list_items, :end_date, :date
    remove_column :watch_list_items, :cost_basis
    remove_column :watch_list_items, :return_basis
  end
end
