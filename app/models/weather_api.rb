class WeatherApi < ApplicationRecord
    require 'net/http'

    def self.open_weather_map(city)
        # set base_url
        base_url = self.open_weather_map_based_url

        #set api url
        url = "#{base_url}/data/2.5/weather?q=#{city}&appid=#{self.open_weather_map_appid}"

        puts "GET | #{url}".to_s.red

        # response after request sent
        response = HTTP.headers(:accept => "application/json").get(url)
        return self.handle_response(response)
    end


    private
    # handle return value after got response from weather server
    def self.handle_response(response)
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
        'https://api.openweathermap.org'
    end

    # openweathermap API key
    def self.open_weather_map_appid
        'fbbd8920cccc59c7f9f663cff7ff6bf3'
    end
end
