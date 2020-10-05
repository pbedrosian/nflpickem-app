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

    def self.current_week_pick
        week = Week.all.select do |w| 
            if Time.now.between?(w.start_of_week.to_time, w.end_of_week.to_time)
                w.id
            end
        end
        week[0]
    end

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
        w.days_played.map do |d|
            arr << w.games_by_day(d)
        end
        arr
    end

end
