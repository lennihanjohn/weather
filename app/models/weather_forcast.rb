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
       
    delegate :country, to: :city

    def self.calculate_results(geo_result)
        open_weather_map_response= WeatherApi.open_weather_map(geo_result.coordinates[0],geo_result.coordinates[1])
        open_weather_map_weather_forcast = WeatherForcast.store_data(open_weather_map_response[1],geo_result.city,geo_result.country) if open_weather_map_response[0] == 200

        dark_sky_response= WeatherApi.dark_sky(geo_result.coordinates[0],geo_result.coordinates[1])
        dark_sky_weather_forcast = WeatherForcast.store_data(dark_sky_response[1],geo_result.city,geo_result.country) if dark_sky_response[0] == 200

        return [open_weather_map_weather_forcast, dark_sky_weather_forcast]
    end

    def self.store_data(params,city_name,country_name)
        ActiveRecord::Base.transaction do
            weather_description_data = self.weather_description_params(params)
            weather_description = WeatherDescription.save_record(weather_description_data)

            country_data = self.country_params(country_name)
            country = Country.save_record(country_data)

            city_data = self.city_params(params, city_name, country.id)
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
            temperature: params['main'].nil? ? params['currently']['temperature'] : params['main']['temp'], 
            min_temperature: params['main'].nil? ? params['daily']['data'][0]['temperatureMin'] : params['main']['temp_min'], 
            max_temperature: params['main'].nil? ? params['daily']['data'][0]['temperatureMax'] : params['main']['temp_max'], 
            humidity: params['main'].nil? ? params['daily']['data'][0]['humidity'].to_f * 100 : params['main']['humidity'], 
            pressure: params['main'].nil? ? params['daily']['data'][0]['pressure'] : params['main']['pressure'], 
            sunrise: self.time_converter(params['sys'].nil? ? params['daily']['data'][0]['sunriseTime'] : params['sys']['sunrise']), 
            sunset: self.time_converter(params['sys'].nil? ? params['daily']['data'][0]['sunsetTime'] : params['sys']['sunset'])
        }
    end

    # return city attributes
    def self.city_params(params,city_name,country_id)
        return {
            country_id: country_id,
            name: city_name, 
            lat: params['coord'].nil? ? params['latitude'] : params['coord']['lat'], 
            lon: params['coord'].nil? ? params['longitude'] : params['coord']['lon']
        }
    end

    # return country attribute
    def self.country_params(country)
        return {
            name: country
        }
    end

    # return weather description attribute
    def self.weather_description_params(params)
        return {
            description: params['weather'].nil? ? params['currently']['summary'] : params['weather'][0]['description'].to_s.capitalize
        }
    end

    def self.time_converter(i)
        return Time.at(i)
    end
end
