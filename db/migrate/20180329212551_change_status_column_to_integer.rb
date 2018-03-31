class ChangeStatusColumnToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :status, :integer
  end
end
