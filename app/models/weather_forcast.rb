# == Schema Information
#
# Table name: weather_forcasts
#
#  id                      :integer          not null, primary key
#  cities_id               :integer          not null
#  weather_description_id :integer           not null
#  temperature             :integer          not null
#  min_temperature         :integer          not null
#  max_temperature         :integer          not null
#  humidity                :integer          not null
#  pressure                :integer          not null
#  sunrise                 :time             not null
#  sunset                  :time             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class WeatherForcast < ApplicationRecord
    # ASSOCIATIONS
    belongs_to :city
    belongs_to :weather_description
    #NEST ATTRIBUTES
    accepts_nested_attributes_for :weather_description, allow_destroy: true
    accepts_nested_attributes_for :city, allow_destroy: true
       
    delegate :country, to: :city

    def self.store_data(params)
        ActiveRecord::Base.transaction do
            weather_description_data = self.weather_description_params(params)
            weather_description = WeatherDescription.save_record(weather_description_data)

            country_data = self.country_params(params)
            country = Country.save_record(country_data)

            city_data = self.city_params(params, country.id)
            city = City.save_record(city_data)

            weather_forcast_data = self.weather_forcast_params(params,weather_description.id, city.id) 
            weather_forcast = self.save_record(weather_forcast_data)

            return weather_forcast
        end
    end

    def self.save_record(params)
        return self.find_or_create_by(params)
    end

    def city_name_with_country
        return self.city.name + ", " + self.country.name
    end
    
    private

     # return weather attributes
     def self.weather_forcast_params(params,weather_description_id, city_id)
        return {
            weather_description_id: weather_description_id,
            city_id: city_id,
            temperature: params['main']['temp'], 
            min_temperature: params['main']['temp_min'], 
            max_temperature: params['main']['temp_max'], 
            humidity: params['main']['humidity'], 
            pressure: params['main']['pressure'], 
            sunrise: self.time_converter(params['sys']['sunrise']), 
            sunset: self.time_converter(params['sys']['sunset'])
        }
    end

    # return city attributes
    def self.city_params(params,country_id)
        return {
            country_id: country_id,
            name: params['name'], 
            lat: params['coord']['lat'], 
            lon: params['coord']['lon']
        }
    end

    # return country attribute
    def self.country_params(params)
        return {
            name: params['sys']['country']
        }
    end

    # return weather description attribute
    def self.weather_description_params(params)
        return {
            description: params['weather'][0]['description']
        }
    end

    def self.time_converter(i)
        return Time.at(i)
    end
end
