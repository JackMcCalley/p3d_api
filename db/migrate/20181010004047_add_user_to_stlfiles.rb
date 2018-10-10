class AddUserToStlfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :stlfiles, :user, foreign_key: true
  end
end
