class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, limit: 18
      t.string :email, null: false, unique: true
      t.string :location
      t.string :interests
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
