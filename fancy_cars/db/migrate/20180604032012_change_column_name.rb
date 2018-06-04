class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :cars, :modle, :model
  end
end
