class Order < ApplicationRecord

  include DistanceCalculator

  belongs_to :vendor
  enum status: [:delivered, :not_delivered]
  enum deliver_time: [:normal, :not_normal, :very_late]
  geocoded_by :address
  after_validation :geocode
  after_create :order_deliver_time
  before_create :set_as_not_delivered


  # 3k normal -- 5k Not normal
  MAXIMUM_SHIPPING_DISTANCE = { 
    'normal' => 1865,
    'not_normal' => 3107
  }.freeze
 
  #value as in days
  DELIVERED_TIME = { 
    'normal' => 5, 
    'not_normal' => 10,
    'very_late' => 15
  }.freeze

  def order_deliver_time 
    shipping_distance = calculate_distance_between_order_and_vendor
    if shipping_distance <= MAXIMUM_SHIPPING_DISTANCE["normal"] 
      self.normal!
    elsif shipping_distance <= MAXIMUM_SHIPPING_DISTANCE["not_normal"]
      self.not_normal!
    else
      self.very_late!
    end
  end

  def set_as_not_delivered
    self.status = "not_delivered"
  end

  def self.create_random_address
    state = CS.states(:us).keys.sample
    city = CS.cities(state,:us).sample
  end
end
