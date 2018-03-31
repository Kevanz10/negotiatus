class AddColumnsToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :address, :string
    add_column :vendors, :name, :string
  end
end
