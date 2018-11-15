class AddBoneLevelGuideToRxforms < ActiveRecord::Migration[5.2]
  def change
      add_column :rxforms, :boneLevelGuide, :boolean
  end
end
