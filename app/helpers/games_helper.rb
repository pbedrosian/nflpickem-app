module GamesHelper

    def weekly_games
        Week.current_week.games
    end

    def matchup(game)
        "#{game.home_team.name} vs. #{game.away_team.name}"
    end
    
    def get_game(pick)
        team = pick.team
        Game.where(week: Week.current_week, home_team: team).or(Game.where(week: Week.current_week, away_team: team)).first
    end
end
