# == Schema Information
#
# Table name: inventories
#
#  id                  :integer          not null, primary key
#  prodno              :integer
#  upc                 :integer
#  mf_id               :string
#  msrp                :float
#  dealer_price        :float
#  name                :string
#  qty_ut              :string
#  qty_ky              :integer
#  kit_qty             :string
#  weight              :float
#  depth               :float
#  height              :float
#  width               :float
#  discontinue         :string
#  picture             :string
#  brand               :string
#  color               :string
#  size                :string
#  ormd                :boolean
#  no_export           :boolean
#  special_ord         :boolean
#  oversize            :boolean
#  note                :text
#  rmatv_price         :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :text
#  product_category_id :integer
#

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
