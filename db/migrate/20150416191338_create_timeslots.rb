class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.datetime :time
      t.references :user
      t.integer :offer_id, default: :null
    end
  end
end
