# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  country_id :integer
#  name       :string
#  lat        :float
#  lon        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
