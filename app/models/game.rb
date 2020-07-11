class Game < ApplicationRecord
    belongs_to :home_team, class_name: 'Team'
    belongs_to :away_team, class_name: 'Team'
    belongs_to :week
   
    def time
        self.date.to_time.strftime("%B %d, %Y at%l:%M %p")
    end

end
