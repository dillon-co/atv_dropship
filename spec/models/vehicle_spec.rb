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

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
