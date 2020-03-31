class ClaimDeadlineMailer < ApplicationMailer
    default from: 'team@tarjim.ly'
    def claim_24hr_deadine(claim_id)
        @claim = Claim.find_by_id(claim_id)
        translator_email = @claim.email
        @request = Request.find_by_id(@claim.request_id)
        @rid = @request.id
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
        mail(to: translator_email, subject: "Your claimed request #{@request.title} is due in 24 Hours!")
    end
end