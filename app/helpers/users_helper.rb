module UsersHelper
    def access?(params)
        !(params[:user_id].to_i == current_user.id)
    end
end
