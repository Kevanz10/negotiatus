require 'rails_helper'

RSpec.describe Order, :type => :model do
 
  let(:vendor) {Vendor.create!(name: "vendor", 
                  address: "Centro Comercial Oviedo, Cr 43A, Medellín, Medellin, Antioquia")}

  let(:order) {Order.new(order_number: 10, tracking_number: 10, vendor_id: vendor.id)}
  
  describe '#order_deliver_time' do
    context "when distance is equal or less than 1865 miles" do
      it "sets deliver time as normal" do
        order.address = "Salitre Mágico Parque de diversiones"
        order.save
        expect(order.deliver_time).to eq("normal")
      end
    end

    context "when distance is between interval of 1865 and 3107 miles" do
      it "sets deliver time as normal" do
        order.address = "The White House, Pennsylvania Avenue Northwest, Washington, DC, USA"
        order.save
        expect(order.deliver_time).to eq("not_normal")
      end
    end

    context "when the distance greater than 3107" do
      it "sets deliver time as very_late " do
        order.address = "Estancia Punta del Lago, Santa Cruz Province, Argentina"
        order.save
        expect(order.deliver_time).to eq("very_late")
      end
    end
  end

  describe '#set_as_not_delivered' do
    context "when object is created" do
      it "sets status as not delivered" do
        order.address = "Salitre Mágico Parque de diversiones"
        order.save
        expect(order.status).to eq("not_delivered")
      end
    end
  end
end