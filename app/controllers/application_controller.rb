class ApplicationController < ActionController::Base
    #login check filter 

    def not_found
        raise ActionController::RoutingError.new('Not Found')
        render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
    end
end
