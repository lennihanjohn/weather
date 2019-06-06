class HomesController < ApplicationController

    def search_city
        #Bing APi search for city
        @geo_result = GeocoderApi.validate_city(params[:search_city][:city])
        #  2 APIs for the temp record  
        @weather_forcasts = WeatherForcast.calculate_results(@geo_result) unless @geo_result.nil? 
        respond_to do |format|
            format.js
        end
    end
end
