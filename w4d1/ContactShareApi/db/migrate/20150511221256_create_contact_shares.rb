class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|

      t.timestamps null: false
    end
  end
end
