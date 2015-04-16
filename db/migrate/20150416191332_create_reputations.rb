class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.integer :teacher_id, index: true
      t.integer :judge_id, index: true
      t.integer :rating

      t.timestamps

    end
  end
end
