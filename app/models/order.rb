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
#  order_status_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Order < ApplicationRecord
  # belongs_to :order_status

  has_many :order_items
  # before_create :set_order_status
  # before_save :update_subtotal
  # after_create :send_order_to_rmatv_worker

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
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
