# == Schema Information
#
# Table name: inventories
#
#  id           :integer          not null, primary key
#  prodno       :integer
#  upc          :integer
#  mf_id        :string
#  msrp         :float
#  dealer_price :float
#  name         :string
#  qty_ut       :string
#  qty_ky       :integer
#  kit_qty      :string
#  weight       :float
#  depth        :float
#  height       :float
#  width        :float
#  discontinue  :string
#  picture      :string
#  brand        :string
#  color        :string
#  size         :string
#  ormd         :boolean
#  no_export    :boolean
#  special_ord  :boolean
#  oversize     :boolean
#  note         :text
#  rmatv_price  :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#

FactoryBot.define do
  factory :inventory do
    PRODNO ""
    UPC 1
    MF_ID 1
    MSRP 1.5
    DEALER_PRICE 1.5
    NAME "MyString"
    QTY_UT "MyString"
    QTY_KY 1
    KIT_QTY "MyString"
    WEIGHT 1.5
    DEPTH 1.5
    HEIGHT 1.5
    WIDTH 1.5
    DISCONTINUE "MyString"
    PICTURE "MyString"
    BRAND "MyString"
    COLOR "MyString"
    SIZE 1.5
    ORMD false
    NO_EXPORT false
    SPECIAL_ORD false
    OVERSIZE false
    NOTE "MyText"
    RMATV_PRICE 1.5
  end
end
