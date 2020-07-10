class GamesController < ApplicationController
    def schedule
        # @games = Week.current_week.games
        @games = Week.search(params[:week])
        @weeks = Week.all
    end
end
