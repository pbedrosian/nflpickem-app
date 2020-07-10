module GamesHelper

    def weekly_games
        Week.current_week.games
    end

    def matchup(game)
        "#{game.home_team.name} vs. #{game.away_team.name}"
    end
    
end
