class UsersController < ApplicationController
    before_action :authenticate_user!, except: :home

    def index
    end
    
    def home
        
    end

    def show
        if helpers.access?(params[:id])
            redirect_to user_path(current_user)
        end
    end
    
    
end
