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

class City < ApplicationRecord
    # ASSOCIATIONS
    belongs_to :country
    has_many :weather_forcasts


    def self.save_record(params)
        return self.find_or_create_by(params)
    end
end
