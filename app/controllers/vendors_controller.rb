class VendorsController < ApplicationController

  def create
    @order = Vendor.create(vendor_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :index, status: :created, location: @order }
      else
        format.html { redirect_to orders_path, notice: 'An error has ocurred, please try again' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit(:address, :name, :address, :latitude, :longitude)
  end
end
