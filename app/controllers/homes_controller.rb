class HomesController < ApplicationController
    def index
        
    end

    def search_city
        # openweathermap api
        @parsed_json = WeatherApi.openweathermap(params[:search_city][:city])
        #test json
    #    @parsed_json =  {"coord"=>{"lon"=>-75.69, "lat"=>45.42}, "weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"overcast clouds", "icon"=>"04n"}], "base"=>"stations", "main"=>{"temp"=>283.04, "pressure"=>1011, "humidity"=>93, "temp_min"=>282.59, "temp_max"=>283.71}, "visibility"=>24140, "wind"=>{"speed"=>2.1, "deg"=>210}, "clouds"=>{"all"=>90}, "dt"=>1559705672, "sys"=>{"type"=>1, "id"=>872, "message"=>0.0059, "country"=>"CA", "sunrise"=>1559639791, "sunset"=>1559695554}, "timezone"=>-14400, "id"=>6094817, "name"=>"Ottawa", "cod"=>200}
        # @errors = "abc"
        respond_to do |format|
            format.js
        end
    end
end
