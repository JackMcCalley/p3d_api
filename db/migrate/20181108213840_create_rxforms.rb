class CreateRxforms < ActiveRecord::Migration[5.2]
  def change
    create_table :rxforms do |t|
      t.text :doctor
      t.integer :case
      t.text :address
      t.text :phone
      t.text :patient
      t.boolean :toothSupportedGuide
      t.boolean :tissueLevelGuide
      t.boolean :boneReductionGuide
      t.boolean :hasStl
      t.boolean :maxillary
      t.boolean :mandibular
      t.integer :numberOfImplants
      t.integer :anchorPins
      t.text :implantLocations
      t.text :implantSystem
      t.text :guidedSurgerySystem

      t.timestamps
    end
  end
end
