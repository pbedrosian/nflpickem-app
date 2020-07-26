class Game < ApplicationRecord
    belongs_to :home_team, class_name: 'Team'
    belongs_to :away_team, class_name: 'Team'
    belongs_to :week
   
    def time
        self.date.to_time
    end

    def self.get_game(team) #gets single game for the week when passing in team
        Game.where(week: Week.current_week, home_team: team).or(Game.where(week: Week.current_week, away_team: team))
    end
end
