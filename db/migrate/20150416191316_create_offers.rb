class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :timeslot
      t.integer :student_id
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
