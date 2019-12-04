class ApplicationController < ActionController::Base
   before_action :tarjimly_user 

    def tarjimly_user
        if session[:tarjimlyID]
            @tarjimly_user = TarjimlyServer.find(session[:tarjimlyID])
        else
            flash[:alert] = "Unsucessfull user identification! Pleas log in again!"
        end
    end

    def authorize 
        if !@tarjimly_user.present? 
            flash[:alert] = "You are not authorized to view this page!"
            redirect application_url
        elsif @tarjimly_user.isTranslator 
            redirect_to :controller => 'claim', :action => 'index' 
        else
            redirect_to :controller => 'request', :action => 'index' 
 
        end 

    end

end
