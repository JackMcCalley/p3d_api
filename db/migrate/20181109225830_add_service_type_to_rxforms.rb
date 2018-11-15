class AddServiceTypeToRxforms < ActiveRecord::Migration[5.2]
  def change
    add_column :rxforms, :serviceType, :string
  end
end
