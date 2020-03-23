
class RequestMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    # prepend_view_path "completed_request"
    puts "OPENED UP SPECIFIC MAILER AND MADE PROGRESSS"

    def completed_request(claim_id)
        @claim = Claim.find_by_id(claim_id)
        @req = Request.find_by_id(@claim.request_id)
        user_email = @req.email
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
        @to_lang = @req.to_language
        @from_lang = @req.from_language
        @title = @req.title 

        mail(to: user_email, subject: "Your request #{@req.title} has been completed!" )
    end
end
