class PicksController < ApplicationController
    before_action :authenticate_user!

    def index
        binding.pry
        @picks = current_user.picks
    end

    def new
        #@games = Game.all.select {|g| g.week == 12} #add current_week method to get current week
        @pick = current_user.picks.new
    end

    def create
        @pick = current_user.picks.new(picks_params)
        if @pick.save
            redirect_to user_picks_path
        else
            render :new
        end
    end

    def show
        
    end

    def edit
        user = User.find_by_id(params[:user_id])
        @pick = user.picks.find_by_id(params[:id])
    end

    def update
        
    end

    private

    def picks_params
        params.require(:pick).permit(:team_id, :buy_in)
    end
end
