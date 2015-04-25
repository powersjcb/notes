class CreateWatchListItems < ActiveRecord::Migration
  def change
    create_table :watch_list_items do |t|
      t.integer :company_id
      t.float :cost_basis
      t.float :return_basis

      t.timestamps
    end
  end
end
