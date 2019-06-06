class GeocoderApi < ApplicationRecord
    require 'net/http'
    # according to the address or city. 
    # validate by bing map api
    def self.validate_city(city)
        results = Geocoder.search(city)
       return results.first
    end
end
