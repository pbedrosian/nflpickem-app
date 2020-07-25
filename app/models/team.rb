class Team < ApplicationRecord 
    belongs_to :picks

    has_many :users, through: :picks

    has_many :home_games, class_name: "Game", foreign_key: "home_team_id"
    has_many :away_games, class_name: "Game", foreign_key: "away_team_id"

    def games
        games = []
        games << home_games
        games << away_games
        games.flatten
    end

    def current_game
        self.games.select |g|
            g.week current_week.id
        end
    end


    private

    def self.search(params)
        find(params.to_i)
    end

end
