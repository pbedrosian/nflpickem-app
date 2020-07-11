module WeeksHelper
    def current_week
        week = Week.all.select do |w| 
            if Time.now.between?(w.start_of_week.to_time, w.end_of_week.to_time)
                w.id
            end
        end
        week[0]
    end
end