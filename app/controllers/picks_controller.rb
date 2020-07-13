class PicksController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @picks = current_user.picks
        if helpers.access?(params[:user_id])
            redirect_to user_picks_path(current_user)
        end
    end
    
    def show

    end

    def new
        @pick = Pick.new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path
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
        @pick = current_user.picks.find_by_id(params[:id])
    end

    def update
        @pick = current_user.picks.find_by_id(params[:id])
        @pick.update(picks_params)
        if @pick.save
          redirect_to user_picks_path
        else
          render :edit
        end
    end

    private

    def picks_params
        params.require(:pick).permit(:team_id, :buy_in)
    end
end
