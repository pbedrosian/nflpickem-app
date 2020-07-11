module UsersHelper
    def access?(id)
        !(id.to_i == current_user.id)
    end
end
