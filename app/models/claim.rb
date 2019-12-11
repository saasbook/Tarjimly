class Claim < ApplicationRecord
    belongs_to :request, foreign_key: "request_id"

    def getDaysLeft(request)
        days_left = ((request.deadline - request.created_at).to_i)/86400
        if days_left == -1
          return "1 day ago", true
        elsif days_left < 0
          return (-1*days_left).to_s + " days ago", true
        elsif days_left == 0
          return "Today", true
        elsif days_left == 1
          return "1 day", true
        else
          return days_left.to_s + " days", false
        end
      end
      
end
