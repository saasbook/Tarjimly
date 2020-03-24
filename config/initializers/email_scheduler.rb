require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '12h' do
    Rails.logger.info "hello, it's #{Time.now}"
    Rails.logger.flush
    @all_calims = Claim.where(_status: 0)
    range_start = DateTime.now + 1
    range_end = DateTime.now  + 1.5

    @all_calims.select { |c|
        (range_start..range_end).include?(Request.find_by_id(c.request_id).deadline)
    }
    @all_calims.each do |claim|
        ClaimDeadlineMailer.claim_24hr_deadine(claim.id).deliver
    end
end