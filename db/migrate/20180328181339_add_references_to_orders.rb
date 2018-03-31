class AddReferencesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :vendor, index: true
  end
end
