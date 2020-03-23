
class RequestMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    # prepend_view_path "completed_request"
    puts "OPENED UP SPECIFIC MAILER AND MADE PROGRESSS"

    def completed_request(claim_id)
        puts ""
        puts "HELLLOOOO THIS WILL WORK"
        puts claim_id
        @claim = Claim.find_by_id(claim_id)
        if @claim.nil? 
            puts "FUCKK EMPTY"
        end
        @req = Request.find_by_id(@claim.request_id)
        user_email = @req.email
        puts ""
        puts ""
        puts "under will be email for translator"
        puts @claim.email
        # puts "under will be email for aid worker"
        # puts @claim.request.email
        puts "under will be the actual email for aid worker"
        puts @req.email
        puts "under will be the resuest ID"
        puts @claim.request_id
        puts ""
        puts ""
        attachments.inline['logo-2.png'] = File.read('app/assets/images/logo-2.png')
        # @to_lang = @request.to_language
        # @from_lang = @request.from_language
        # @title = @request.title 

        mail(to: user_email, subject: "Your request '#{@req.title}' has been completed!" )
    end
end
