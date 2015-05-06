class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps null: false
    end

    add_index(:users, :email, { name: 'users_email_index', unique: true })
  end
end
