class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.string :session_token, null:false
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :user_sessions, :session_token, unique: true
    add_index :user_sessions, :user_id
  end
end
