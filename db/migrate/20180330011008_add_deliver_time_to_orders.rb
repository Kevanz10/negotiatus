class AddDeliverTimeToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :deliver_time, :integer
  end
end
