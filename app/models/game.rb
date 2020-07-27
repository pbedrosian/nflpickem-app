class Game < ApplicationRecord
    belongs_to :home_team, class_name: 'Team'
    belongs_to :away_team, class_name: 'Team'
    belongs_to :week
   
    def time
        self.date.to_time
    end

    def self.get_game(picks) #gets single game for the week when passing in team
        picks.each do |p| 
            team = p.team
            picked_game = Game.where(week: Week.current_week, home_team: team).or(Game.where(week: Week.current_week, away_team: team)).first
            game_score = Api.data["games"].select {|g| g["schedule"]["id"] == picked_game.api_id}.first["score"]
            # if game_score["awayScoreTotal"] && game_score["homeScoreTotal"] == nil
            #     "Game has not Started, check back soon"
            # elsif game_score["awayScoreTotal"] > game_score["homeScoreTotal"]
            #     "Away Team won"
            # else game_score["awayScoreTotal"] < game_score["homeScoreTotal"]
            #     "Home Team won"
            # end            
        end
    end 

    # gets the game based on the team picked from the API data
    # game_data = data["games"].select {|g| g["schedule"]["id"] == picked_game.api_id}
end
