class ClaimDeadlineMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    def claim_24hr_deadine(claim)
        puts "24hr DEADLINE FOR UNCOMPLETED CLAIMED TRANSLATIONS"
        @claim = claim
        translator_email = @claim.email
        puts ""
        puts ""
        puts translator_email
        puts ""
        puts ""
        @title = Request.find_by_id(@claim.request_id).title
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')

        mail(to: translator_email, subject: "Your claimed request #{@title} is due in 24 Hours!")
    end
end
