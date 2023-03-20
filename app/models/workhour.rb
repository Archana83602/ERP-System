class Workhour < ApplicationRecord
    belongs_to :user
    validates :type, inclusion: { in: [true, false] }
    self.inheritance_column = :inheritance_type

    def self.calculate_total_time(user_id, date)
        workhours = Workhour.where(user_id: user_id, date: date).order(:time)
        total_time = 0
        last_true_workhour = nil
      
        workhours.each do |workhour|
          if workhour.type # true
            last_true_workhour = workhour
          elsif last_true_workhour.present?
            time_diff = (workhour.time - last_true_workhour.time) / 3600.0
            total_time += time_diff
            last_true_workhour = nil
          end
        end
              
        if last_true_workhour.present?
          current_time = Time.current.in_time_zone('New Delhi')
          time_diff = (current_time - last_true_workhour.time) / 3600.0

          total_time += time_diff
        end
          
        Time.at(total_time * 3600).utc.strftime("%H:%M:%S")
    end
      
      

end
