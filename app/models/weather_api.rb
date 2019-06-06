class WeatherApi < ApplicationRecord
    require 'net/http'

    def self.open_weather_map(lat,lon)
        # set base_url
        base_url = self.open_weather_map_based_url

        #set api url
        url = "#{base_url}/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{self.open_weather_map_appid}&units=metric"

        puts "open_weather_map GET | #{url}".to_s.red

        # response after request sent
        return self.handle_response(url)
    end

    def self.dark_sky(lat,lon)
        #https://api.darksky.net/forecast/[key]/[latitude],[longitude]
        base_url = self.dark_sky_based_url
        #set api url 
        url = "#{base_url}/#{self.dark_sky_secret_key}/#{lat.to_f},#{lon.to_f}?units=si"

        puts "dark_sky GET | #{url}".to_s.red

        # response after request sent
        return self.handle_response(url)
    end

    private
    # handle return value after got response from weather server
    def self.handle_response(url)
            response = HTTP.headers(:accept => "application/json").get(url)
            puts "response code: #{response.code}".to_s.red
            return [response.code, response] unless response.code == 200
            return [response.code, self.parse_json(response.body)]
    end

    #parse to json format and store data to db
    def self.parse_json(body)
         params = JSON.parse(body)
         return params
    end

    # openweathermap API key
    def self.open_weather_map_based_url
        return 'https://api.openweathermap.org'
    end

    # dark_sky API key
    def self.dark_sky_based_url
        return 'https://api.darksky.net/forecast'
    end

    # openweathermap API key
    def self.open_weather_map_appid
        return 'fbbd8920cccc59c7f9f663cff7ff6bf3'
    end

       # dark_sky Secret Key
    def self.dark_sky_secret_key
        return 'c7b5a635bbde3034e8a39316d2110cc5'
    end
end
