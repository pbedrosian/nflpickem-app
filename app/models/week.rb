class Week < ApplicationRecord  
    has_many :games
    has_many :picks

    def self.current_week
        week = Week.all.select do |w| 
            if Time.now.between?(w.start_of_week.to_time, w.end_of_week.to_time)
                w.id
            end
        end
        week[0]
    end

    def self.search(query)
        if query.present? 
            self.find_by_id(query).games
        else 
            self.current_week.games
        end
    end
end
