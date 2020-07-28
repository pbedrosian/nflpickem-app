class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      name = provider_data.info.name.split
      user.first_name = name.first
      user.last_name = name.last
    end
  end
        
  
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
  validates :username, uniqueness: true
  validates :username, presence: true


  
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

  def self.search(query)
    if query.present?
      where('USERNAME like ?', "%#{query}%")
    else
      self.all
    end
  end

  # def self.news
  #   require 'rss'
  #   require 'open-uri'

  #   url = 'https://www.espn.com/espn/rss/nfl/news'
  #   open(url) do |rss|
  #       feed = RSS::Parser.parse(url)
  #       binding.pry
  #       title = feed.title
  #       feed.items.each do |item|
  #       puts "Item: #{item.title}"
  #       end
  #   end
  # end
  
end
