class RemoveBoardFromExecutives < ActiveRecord::Migration
  def change
    remove_column :executives, :board_id
  end
end
