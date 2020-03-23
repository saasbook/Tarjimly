class ClaimDeadlineMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    def claim_24hr_deadine(claim_id)
        puts "WE ARE SENDING AN EMAIL YIPPEEEE"
        @claim = Claim.find_by_id(claim_id)
        translator_email = @claim.email
        @request = Request.find_by_id(@claim.request_id)
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
        mail(to: translator_email, subject: "Your claimed request #{@request.title} is due in 24 Hours!")
    end
end
xss