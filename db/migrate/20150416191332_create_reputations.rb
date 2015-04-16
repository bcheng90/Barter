class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.integer :user_id, index: true
      t.integer :judge_id, index: true
      t.integer :rating

      t.timestamps

    end
  end
end
