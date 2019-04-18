class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :headquarters, :adress, :address
  end
end
