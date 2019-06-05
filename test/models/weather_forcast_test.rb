# == Schema Information
#
# Table name: weather_forcasts
#
#  id                     :integer          not null, primary key
#  city_id                :integer
#  weather_description_id :integer
#  temperature            :integer
#  min_temperature        :integer
#  max_temperature        :integer
#  humidity               :integer
#  pressure               :integer
#  sunrise                :time
#  sunset                 :time
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class WeatherForcastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
