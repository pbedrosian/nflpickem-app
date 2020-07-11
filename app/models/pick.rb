class Pick < ApplicationRecord
    belongs_to :user
    belongs_to :team
    belongs_to :week
  
    validates :team_id, :presence => true
  
    validate :user_quota, :on => :create
  
    #if current_user has a pick within week zone, deny new pick. 
    private 
  
    def user_quota
      if user.picks.this_week.count >= 1
       errors.add(:base, "Your Pick has already been made, please edit your current pick.")
     end
    end
end
