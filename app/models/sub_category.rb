# == Schema Information
#
# Table name: sub_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :inventories
end
