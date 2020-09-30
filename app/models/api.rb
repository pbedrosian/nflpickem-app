class Api < ApplicationRecord

    def self.data
        url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/2020-2021-regular/games.json" 
        HTTParty.get(url)
    end


end