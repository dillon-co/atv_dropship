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

FactoryBot.define do
  factory :order_item do
    product nil
    order nil
    unit_price "9.99"
    quantity 1
    total_price "9.99"
  end
end
