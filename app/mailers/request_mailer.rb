include Rails.application.routes.url_helpers

class RequestMailer < ApplicationMailer
    default from: 'cassihardin@gmail.com'
    prepend_view_path "completed_request"
    puts "OPENED UP SPECIFIC MAILER AND MADE PROGRESSS"

    def completed_request
        puts "hey this is cassidy"
    end

end
