class PicksController < ApplicationController
    before_action :authenticate_user!
    # before_action :access?


    def index
        @picks = current_user.picks
        Game.get_game(@picks)
        if helpers.access?(params) 
            redirect_to user_picks_path(current_user)
        end
    end
    
    def show

    end

    def new        
        @user = current_user
        @pick = Pick.new
        if helpers.access?(params) 
            redirect_to new_user_pick_path(current_user)
        end
    end

    def create
        @pick = current_user.picks.new(picks_params)
        @user = current_user
        @pick.week = Week.current_week
        binding.pry
        if (Pick.valid_pick?(@pick))
            render :new, alert: 'Your selected team is on Bye. Please try again.'
        end
        if @pick.save
            redirect_to user_picks_path
        else
            render :new
        end
    end

    def edit
        @user = current_user
        if @pick = current_user.picks.find_by_id(params[:id])
        else
            redirect_to user_picks_path, alert: 'Invalid Pick. Please try again.'
        end
    end

    def update
        @pick = current_user.picks.find_by_id(params[:id])
        @pick.update(picks_params)
        if (Pick.valid_pick?(@pick))
            render :edit, alert: 'Your selected team is on Bye. Please try again.'
        end
        if @pick.save
          redirect_to user_picks_path
        else
          render :edit
        end
    end

    def destroy
        Pick.find(params[:id]).delete
        redirect_to user_picks_path
    end

    private

    def picks_params
        params.require(:pick).permit(:team_id, :buy_in)
    end
end
