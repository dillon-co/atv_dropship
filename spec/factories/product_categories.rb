# == Schema Information
#
# Table name: product_categories
#
#  id                :integer          not null, primary key
#  name              :string
#  currently_selling :boolean
#  number_of_visits  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :product_category do
    
  end
end
