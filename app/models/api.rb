class Api < ApplicationRecord

    def self.data
        url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/upcoming/games.json" 
        HTTParty.get(url)
    end


end