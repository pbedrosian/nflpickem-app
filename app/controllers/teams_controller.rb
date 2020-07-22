class TeamsController < ApplicationController

    def index
        @teams = Team.all
    end

    def show
        @team = Team.search(params[:id])
    end
end
