class PicksController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @picks = current_user.picks
    end
    
    def show
            
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path
        else
            @pick = current_user.picks.new
        end
    end

    def create
        @pick = current_user.picks.new(picks_params)
        @pick.week = Week.current_week
        if @pick.save
            redirect_to user_picks_path
        else
            render :new
        end
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
