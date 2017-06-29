class AddPatientToEncounters < ActiveRecord::Migration[5.0]
  def change
    add_reference :encounters, :patient, foreign_key: true
  end
end
