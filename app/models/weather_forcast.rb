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
    has_one :city
    has_one :weather_description

    #NEST ATTRIBUTES
    accepts_nested_attributes_for :weather_description, allow_destroy: true
    accepts_nested_attributes_for :city, allow_destroy: true
    accepts_nested_attributes_for :country, allow_destroy: true
       
    def store_data(params)
        weather_description << weather_description_params(params)
        city << city_params(params)
        country << country_params(params)
        weather_forcast << weather_forcast_params(params)
    end

    private

     # return weather attributes
     def weather_forcast_params(params)
        return {
            temperature: params['main']['temp'], 
            min_temperature: params['main']['temp_min'], 
            max_temperature: params['main']['temp_max'], 
            humidity: params['main']['humidity'], 
            pressure: params['main']['pressure'], 
            sunrise: params['sys']['sunrise'], 
            sunset: params['sys']['sunset']
        }
    end

    # return city attributes
    def city_params(params)
        return {
            name: params['name'], 
            lat: params['coord']['lat'], 
            lon: params['coord']['lon']
        }
    end

    # return country attribute
    def country_params(params)
        return {
            name: params['sys']['country']
        }
    end

    # return weather description attribute
    def weather_description_params(params)
        return {
            main: params['weather']['main'],
            description: params['weather']['description']
        }
    end
end
