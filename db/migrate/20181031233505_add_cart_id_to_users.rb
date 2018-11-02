class AddCartIdToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :cart_id, :string
  end
end
