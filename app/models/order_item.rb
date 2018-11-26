# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  unit_price    :decimal(12, 3)
#  quantity      :integer
#  total_price   :decimal(12, 3)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prodno        :string
#  name          :string
#  size          :string
#  vehicle_type  :string
#  vehicle_year  :integer
#  vehicle_make  :string
#  vehicle_model :string
#  color         :string
#

class OrderItem < ApplicationRecord
  # belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present
  # validate :new_order_item

  # before_create :check_for_existing_products

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      Inventory.find_by(prodno: prodno).msrp
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def product_present
    prod = Inventory.find_by(prodno: prodno)
    if prod.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  # def new_order_item
  #   existing_item = self.order.order_items.find_by(prodno: "1406810001")
  #   unless existing_item
  #     true
  #   else
  #     new_quantity = existing_item.quantity + 1
  #     existing_item.update(quantity: new_quantity)
  #     false
  #   end
  # end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
