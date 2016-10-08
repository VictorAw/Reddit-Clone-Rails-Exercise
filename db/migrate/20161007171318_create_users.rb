class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique:true
      t.string :password_digest
      t.string :session_token

      t.timestamps null: false
    end
    add_index :users, :username, unique:true
  end
end
