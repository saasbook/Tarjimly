require 'rest-client'
require 'json'
class AuthController < ApplicationController 

    def authenticate
        begin
            response = RestClient.post(
                'https://tarjim.ly/api/mobile/v1/auth/login', 
                {:email => params[:email], :password => params[:password]}
            )
        rescue RestClient::Exception
            flash[:alert] = "Unsucessful Login! Please Try Again."
            redirect_to root_path
            return
        end
        @tarjimly_id = JSON.parse(response.body)["tarjimly_id"]
        session[:tarjimlyID] = @tarjimly_id
        cookies[:login] = { :tarjimly_user => response.cookies, :expires => Time.now + 3600}
        if login(@tarjimly_id)
            redirect_to :controller => 'requests', :action => 'index' 
         else 
            redirect_to :controller => 'claims', :action => 'index' 
        end
    end 

    def logout 
        flash[:ntoice] = "You have successfully logged out!"
        session.clear
        redirect_to root_path
    end

    private 
    def login(tarjimly_id)
        # FIX THIS - if translator
        return tarjimly_id == 364494 ? true : false
    end 
end
