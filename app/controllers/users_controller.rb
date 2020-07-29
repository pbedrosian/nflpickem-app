class UsersController < ApplicationController
    before_action :authenticate_user!, except: :home
    # before_action :access?


    def index
        @users = User.search(params[:query])
    end
    
    def home
        @news = Rss.news.first[1]["channel"]["item"]
    end

    def show
        if !User.find_by_id(params[:id])
            redirect_to user_path(current_user)
        end
        @user = User.find_by_id(params[:id])
    end
    
    
end
