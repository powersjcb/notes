class AddBoardToExecutives < ActiveRecord::Migration
  def change
    add_column :executives, :board_id, :integer
  end
end
