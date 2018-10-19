# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :integer
#  make       :integer
#  model      :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :vehicle do
    user nil
    type 1
    make 1
    model 1
    year 1
  end
end
