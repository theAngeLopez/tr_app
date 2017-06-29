class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.string :visit_number
      t.datetime :admitted_at
      t.datetime :discharged_at
      t.string :location
      t.string :room
      t.integer :bed

      t.timestamps
    end
  end
end
