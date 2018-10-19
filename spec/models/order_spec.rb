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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
