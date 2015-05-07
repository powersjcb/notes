class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :body, limit: 1023, null: false

      t.timestamps null: false
    end

    add_index :answer_choices, :question_id
  end
end
