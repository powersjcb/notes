class AddExchangeIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :exchange_id, :integer
  end
end
