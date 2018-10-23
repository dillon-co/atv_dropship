# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_name       :string
#  prodno          :string
#  street_address  :string
#  city            :string
#  state           :string
#  zip             :string
#  subtotal        :decimal(12, 3)
#  tax             :decimal(12, 3)
#  shipping        :decimal(12, 3)
#  total           :decimal(12, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string
#  last_name       :string
#  phone           :string
#  text_deals      :boolean
#  email           :string
#  subscribed      :boolean
#  shipping_method :integer
#

class Order < ApplicationRecord
  # belongs_to :order_status

  has_many :order_items
  # before_create :set_order_status
  # before_save :update_subtotal
  # after_create :send_order_to_rmatv_worker

  enum shipping: {
    "Standard" => 0,
    "Two Day" => 1,
    "Next Day" => 2
  }

  enum order_status: [:pending, :paid]

  # def calculate_shipping
  #
  # end

  def subtotal
    order_items.collect { |oi| oi.quantity * oi.unit_price  }.sum
  end

  def total_weight
    order_items.collect { |oi| Inventory.find_by(prodno: oi.prodno).weight }.sum
  end

  def shipping_cost(shipping_method=self.shipping)
    case shipping_method
    when "Standard" || 0
      (total_weight * 0.27 )
    when "Two Day" || 1
      (total_weight * 0.5 )
    when "Next Day" || 2
      (total_weight * 0.82 )
    else
      0
    end
  end

  def total
    subtotal + shipping_cost(shipping)
  end

  def send_order_to_rmatv_worker
    OrderProductsWorker.perform_async(self)
  end

private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
