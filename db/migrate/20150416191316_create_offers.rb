class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :timeslot
      t.references :user
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
