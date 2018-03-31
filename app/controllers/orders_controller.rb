class OrdersController < ApplicationController
  def index
    @order = Order.new
    @orders = Order.where(status: 1).order("status DESC")
    @orders = Order.all
    @hash = Gmaps4rails.build_markers(@orders) do |order, marker|
      marker.lat order.latitude
      marker.lng order.longitude
    end
  end

  def create
    @order = Order.create(order_params)
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
  def order_params
    params.require(:order).permit(:order_number, :tracking_number,:address,
                                  :status, :latitude, :longitude, :vendor_id)
  end
end
