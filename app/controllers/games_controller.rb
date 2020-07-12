class GamesController < ApplicationController
    def schedule
        @weeks = Week.all
        @games = Week.search(params[:week])
    end
end
