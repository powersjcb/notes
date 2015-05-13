class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :color, null: false
      t.string :name
      t.string :sex, limit: 1
      t.text   :description, null: false
      t.datetime   :birth_date, null: false
      t.timestamps null: false
    end
  end
end
