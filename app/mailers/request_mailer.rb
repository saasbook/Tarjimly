class RequestMailer < ApplicationMailer
    default from: 'team@tarjim.ly'
    # prepend_view_path "completed_request"

    def completed_request
        @claim = params[:claim]
        @request = Request.find_by_id(@claim.request_id)
        user_email = @request.email
        @url = 'https://tarjimly-docs.com'
        # attatchments.inline['tarjimly_footer.jpg'] = File.read('/images/tarjimlyfooter.jpg')
        mail(to: user_email, subject: "Your request '#{@request.title}' has been completed!")
    end

end
