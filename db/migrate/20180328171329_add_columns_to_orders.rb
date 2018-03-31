class AddColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_number, :integer
    add_column :orders, :tracking_number, :integer
    add_column :orders, :address, :string
    add_column :orders, :status, :string
    add_column :orders, :latitude, :float
    add_column :orders, :longitude, :float
  end
end
