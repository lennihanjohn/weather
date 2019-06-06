class GeocoderApi < ApplicationRecord
    require 'net/http'
    # according to the address or city. 
    # validate by bing map api
    def self.validate_city(city)
        results = Geocoder.search(city)
        return nil if results.first.nil? || self.locate_city?(results.first)
        return results.first
    end

    def self.locate_city?(results)
       return true if results.city.nil? || results.country.nil? 
    end
end
