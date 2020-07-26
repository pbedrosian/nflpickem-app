class Api < ApplicationRecord

    url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/upcoming/games.json" 
    @api = HTTParty.get(url)
    def self.test
        url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/upcoming/games.json" 
        @api = HTTParty.get(url)
    end
    def self.get_team_id(abv)
        team = Team.find_by abbreviation: abv
        team.id
    end

end