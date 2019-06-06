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
    has_many :weather_forcasts

    def self.save_record(params)
        return self.find_or_create_by(params)
    end
    
end
