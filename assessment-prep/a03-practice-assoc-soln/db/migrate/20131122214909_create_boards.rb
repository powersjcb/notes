class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :company_id

      t.timestamps
    end
  end
end
