desc "Update status if delivery time was elapsed" 
task order_status: :environment do
  date_now = DateTime.now.to_date

  Order.not_delivered.find_each do |order|
    if order.normal? && date_now >= (order.created_at + Order::DELIVERED_TIME['normal'].days).to_date
      order.delivered!
    elsif order.not_normal? && (date_now >= (order.created_at + Order::DELIVERED_TIME['not_normal'].days).to_date)
      order.delivered!
    elsif order.very_late? && (date_now >= (order.created_at + Order::DELIVERED_TIME['very_late'].days).to_date)
      order.delivered!
    end
  end 
end

# igual 5 days
# hoy >= 5  <= 10