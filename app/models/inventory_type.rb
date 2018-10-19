# == Schema Information
#
# Table name: inventory_types
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InventoryType < ApplicationRecord
  has_many :categories
end
