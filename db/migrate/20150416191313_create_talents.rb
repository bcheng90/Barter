class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :title, null: false
      t.string :type, null: false
      t.string :sample
      t.string :experience, null: false
      t.text :description

      t.timestamps
    end
  end
end
