class CreateExecutives < ActiveRecord::Migration
  def change
    create_table :executives do |t|
      t.string :name

      t.timestamps
    end
  end
end
