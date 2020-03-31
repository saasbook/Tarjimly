
class RequestMailer < ApplicationMailer
    default from: 'team@tarjim.ly'
    # prepend_view_path "completed_request"

    def completed_request(claim_id)
        @claim = Claim.find_by_id(claim_id)
        @request = Request.find_by_id(@claim.request_id)
        user_email = @request.email
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
    
        mail(to: user_email, subject: "Your request #{@request.title} has been completed!" )
    end
end
