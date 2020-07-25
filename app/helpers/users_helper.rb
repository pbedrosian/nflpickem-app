module UsersHelper
    def access?(params)
        !(params[:user_id].to_i == current_user.id)
    end

    def has_current_pick?
        current_user.picks.any? {|p| p.week == current_week}
    end
end
