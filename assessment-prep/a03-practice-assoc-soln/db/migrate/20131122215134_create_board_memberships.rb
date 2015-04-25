class CreateBoardMemberships < ActiveRecord::Migration
  def change
    create_table :board_memberships do |t|
      t.integer :member_id
      t.integer :board_id

      t.timestamps
    end
  end
end
