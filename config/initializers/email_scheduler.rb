require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
    Rails.logger.info "hello, it's #{Time.now}"
    Rails.logger.flush
# scheduler.cron '0 0 * * *' do
    @all_calims = Claim.where(_status: 0)
    @all_calims.select { |c|
        Request.find_by_id(c.request_id).deadline == Date.tomorrow
    }
    @all_calims.each do |claim|
        ClaimDeadlineMailer.claim_24hr_deadine(claim.id).deliver
    end
end