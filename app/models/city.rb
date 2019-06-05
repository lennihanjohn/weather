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
    has_one :country
    has_many :weather_forcasts
end
