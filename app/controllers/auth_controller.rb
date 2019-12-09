require 'rest-client'
require 'json'
class AuthController < ApplicationController 

    def authenticate
        response = RestClient.post(
            'https://tarjim.ly/api/mobile/v1/auth/login', 
            {:email => params[:email], :password => params[:password]}
        )

        case response.code
        when 400
          [ :error, JSON.parse(response.to_str) ]
          flash[:alert] = "Unsucessful Login! Please Try Again."
        when 200
        #   [ :success, JSON.parse(response.to_str) ]
            @tarjimly_id = JSON.parse(response.body)["tarjimly_id"]
            session[:tarjimlyID] = @tarjimly_id
            cookies[:login] = { :tarjimly_user => response.cookies, :expires => Time.now + 3600}

            if login(@tarjimly_id)
                redirect_to :controller => 'requests', :action => 'index' 
            else 
                redirect_to :controller => 'claims', :action => 'index' 
            end
        else
          fail "Invalid response #{response.to_str} received."
        end
    end 

    def logout 
        session[:tarjimlyID] = nil
        redirect_to root_path
    end

    private 
    def login(tarjimly_id)
        # FIX THIS - if translator
        if tarjimly_id == 364494
            return true
        else 
            return false
        end
    end 
end
