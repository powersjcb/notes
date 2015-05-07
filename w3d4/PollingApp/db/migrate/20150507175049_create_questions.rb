class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.text    :body,  limit: 1023, null: false

      t.timestamps null: false
    end

    add_index :questions, :poll_id
    add_index :questions, :body
  end
end
