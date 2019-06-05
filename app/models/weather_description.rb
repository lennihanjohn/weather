# == Schema Information
#
# Table name: weather_descriptions
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WeatherDescription < ApplicationRecord
    belong_to :weather_forcast
end
