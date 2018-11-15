class AddCommentToRxforms < ActiveRecord::Migration[5.2]
  def change
    add_column :rxforms, :comment, :string
  end
end
