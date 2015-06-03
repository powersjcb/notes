class CreateTodoComments < ActiveRecord::Migration
  def change
    create_table :todo_comments do |t|
      t.string :content, null: false
      t.integer :todo_id, null: false

      t.timestamps null: false
    end
  end
end
