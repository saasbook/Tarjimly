class ClaimDeadlineMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    def claim_24hr_deadine(claim_id)
        @claim = Claim.find_by_id(claim_id)
        translator_email = @claim.email
        @title = Request.find_by_id(@claim.request_id).title
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
        mail(to: translator_email, subject: "Your claimed request #{@title} is due in 24 Hours!")
    end
end
