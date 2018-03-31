class AddLatitudeAndLongitudeToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :latitude, :float
    add_column :vendors, :longitude, :float
  end
end
