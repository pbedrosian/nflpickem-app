module TeamsHelper
    def opponents(team,game)
        opponent = nil
        if game.home_team == team 
            opponent = game.away_team
        else game.away_team == team
            opponent = game.home_team
        end
        opponent.name
    end
end
