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

    # def self.search(query)
    #     if query.present? 
    #         self.find_by_id(query).games
    #     else 
    #         self.current_week.games
    #     end
    # end

    def days_played
        days = self.games.map do |g|
            g.date.to_time.strftime('%A')
        end
        days.uniq
    end

    def games_by_day(day)
        self.games.select{|g| g.time.strftime('%A') == day}
    end

    def self.search(params)
        arr = []
        if params.nil?
            params = current_week.id
        end
        w = self.find_by_id(params)
         days = w.days_played
        days.map do |d|
            arr << w.games_by_day(d)
        end
        arr
    end
end
