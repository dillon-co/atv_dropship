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

require 'rails_helper'

RSpec.describe DadJoke, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
