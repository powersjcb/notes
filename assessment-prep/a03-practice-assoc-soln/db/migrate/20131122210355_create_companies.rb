class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.float :market_cap
      t.string :ticker_symbol

      t.timestamps
    end
  end
end
