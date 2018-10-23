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

FactoryBot.define do
  factory :order do
    subtotal "9.99"
    tax "9.99"
    shipping "9.99"
    total "9.99"
    order_status nil
  end
end
