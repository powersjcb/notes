class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false, index: true

      t.timestamps null:false
    end
  end
end
