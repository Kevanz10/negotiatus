module DistanceCalculator
  extend ActiveSupport::Concern

  def vendor_address
    vendor = Vendor.find(vendor_id)
    [vendor.latitude, vendor.longitude]
  end 

  def calculate_distance_between_order_and_vendor
    order_address = [latitude, longitude]
    Geocoder::Calculations.distance_between(order_address, vendor_address)
  end  
end