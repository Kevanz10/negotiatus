module OrdersHelper
  def order_status_color(order)
    "red" if order.deliver_time == "very_late"
  end
end
