# == Schema Information
#
# Table name: sub_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :sub_category do
    title "MyString"
  end
end
