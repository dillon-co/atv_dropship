# == Schema Information
#
# Table name: dad_jokes
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :string
#  like_count :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :dad_joke do
    index "MyString"
    show "MyString"
    question "MyString"
    answer "MyString"
  end
end
