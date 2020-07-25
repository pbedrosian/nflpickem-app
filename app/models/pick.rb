class Pick < ApplicationRecord
    belongs_to :user
    belongs_to :team
    belongs_to :week
  
    validates :team_id, :presence => true
  
    validate :user_quota, :on => :create

    url = "http://#{ENV['API_KEY']}@api.mysportsfeeds.com/v2.1/pull/nfl/upcoming/games.json" 
    @api = HTTParty.get(url)

    def self.get_team_id(abv)
        team = Team.find_by abbreviation: abv
        team.id
    end



    def self.get_outcome(picks)
      picks.each do |p| 
        @api
        # binding.pry
      end
    end

    
    def self.valid_pick?(pick)
      pick.team.bye == Week.current_week.id
    end
  
    private 
  
    def user_quota
      if user.picks.this_week.count >= 1
       errors.add(:base, "Your Pick has already been made, please edit your current pick.")
     end
    end
end
