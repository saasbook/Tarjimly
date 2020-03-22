
class RequestMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    prepend_view_path "completed_request"
    puts "OPENED UP SPECIFIC MAILER AND MADE PROGRESSS"

    def completed_request
        @claim = Claim.first
        # if @claim.nil? || @claim.empty?
        #     puts "FUCKK EMPTY"
        # end
        @request = Request.find_by_id(@claim.request_id)
        user_email = @request.email
        @url = 'https://tarjimly-docs.com'
        # attatchments.inline['tarjimly_footer.jpg'] = File.read('/images/tarjimlyfooter.jpg')
        mail(to: user_email, subject: "Your request '#{@request.title}' has been completed!")
    end

end
