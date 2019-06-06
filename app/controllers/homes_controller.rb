class HomesController < ApplicationController
    def index
        
    end

    def search_city
        #Bing APi search for city
        geo_result = GeocoderApi.validate_city(params[:search_city][:city])
        #  2 APIs for the temp record  
        @weather_forcasts = WeatherForcast.calculate_results(geo_result)
        respond_to do |format|
            format.js
        end
    end
end
