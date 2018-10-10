class CreateDicomfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :dicomfiles do |t|
      t.string :filename
      t.string :uploader
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
