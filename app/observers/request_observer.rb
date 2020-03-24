class RequestObserver < ActiveRecord::Observer
    # observe :_status
    def after_update(request)
        # if request._status == 3
        #     puts "EMAIL SENT OUT TO AIDWORKER BECAUSE TRANSLATOR SUBMITTED DOCUMENT FOR THE DOCUMENT CALLED: #{request.title}"
        #     puts "TARJIMLY NAME "
        #     # puts "#{session[:email]}"
        # end

    end
end 