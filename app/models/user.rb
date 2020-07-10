class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :picks do
  def this_week
    where(:created_at => (Week.current_week.start_of_week..Week.current_week.end_of_week))
      end
  end
      
  has_many :teams, through: :picks
  
  validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..40},
                        :on => :create
  
  validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..40},
                        :on => :update
  
  validates :email, uniqueness: true
  validates :email, presence: true
  
  def remaining_teams
      if self.picks.empty?
          Team.all
      else
          picks = self.picks.map {|p| p.team}
          remaining_teams = Team.all - picks
      end
  end
  
  def current_pick
      self.picks.last
  end
end
