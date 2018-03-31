require 'rails_helper'

RSpec.describe Order, :type => :model do
 
  let(:vendor) {Vendor.create!(name: "vendor", 
                  address: "Centro Comercial Oviedo, Cr 43A, Medellín, Medellin, Antioquia")}

  let(:order) {Order.new(order_number: 10, tracking_number: 10, vendor_id: vendor.id)}
  
  describe '#calculate_distance_between_order_and_vendor' do
    context "when object is created" do
      it "calculates the distance and returns a value" do
        order.address = "Salitre Mágico Parque de diversiones"
        order.save
        expect(order.calculate_distance_between_order_and_vendor).not_to eq(nil)
      end
    end
  end
end
