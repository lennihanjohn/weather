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

        # "weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"overcast clouds", "icon"=>"04n"}], "base"=>"stations", "main"=>{"temp"=>283.04, "pressure"=>1011, "humidity"=>93, "temp_min"=>282.59, "temp_max"=>283.71}, "visibility"=>24140, "wind"=>{"speed"=>2.1, "deg"=>210}, "clouds"=>{"all"=>90}, "dt"=>1559705672, "sys"=>{"type"=>1, "id"=>872, "message"=>0.0059, "country"=>"CA", "sunrise"=>1559639791, "sunset"=>1559695554}, "timezone"=>-14400, "id"=>6094817, "name"=>"Ottawa", "cod"=>200}n  
       
    def store_data(params)
        weather_description << weather_description_params(params)
        city << city_params(params)
        country << country_params(params)
        weather_forcast << {}
    end

    private

     # return weather attributes
     def weather_forcast_params(params)
        return {
            temperature: params['name'], 
            min_temperature: params['coord']['lat'], 
            max_temperature: params['coord']['lat'], 
            humidity: params['coord']['lat'], 
            pressure: params['coord']['lat'], 
            sunrise: params['coord']['lat'], 
            sunset: params['coord']['lat']
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
