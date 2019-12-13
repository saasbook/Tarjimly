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
            flash[:notice] = "Unsucessful Login! Please Try Again."
            redirect_to root_path
            return
        end
        @tarjimly_id = JSON.parse(response.body)["tarjimly_id"]
        begin
            user_response = RestClient.get(
                'https://tarjim.ly/api/mobile/v1/users/metadata', 
                {:cookies => response.cookies}
            )
        rescue RestClient::Exception => e
            puts(e.response)
            flash[:notice] = "Unable to authenticate Tarjimly User, please try again."
            redirect_to root_path
            return
        end
        session[:name] = JSON.parse(user_response.body)['fb_first_name'] + " " +  JSON.parse(user_response.body)['fb_last_name']
        session[:email] = JSON.parse(user_response.body)['email']
        session[:role] = JSON.parse(user_response.body)['user_role']
        session[:joined_date] = JSON.parse(user_response.body)['createdAt']
        session[:tarjimlyID] = @tarjimly_id
        session[:time_zone] = Ziptz.new.time_zone_name(JSON.parse(user_response.body)['ip_postal'])
        cookies[:login] = { :tarjimly_user => response.cookies, :expires => Time.now + 3600}
        if session[:role] == "Translator"
            redirect_to :controller => 'claims', :action => 'index' 
         else 
            redirect_to :controller => 'requests', :action => 'index' 
        end
    end 

    def logout 
        session.clear
        cookies.clear
        redirect_to root_path
    end
end