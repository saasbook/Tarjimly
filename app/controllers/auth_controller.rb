class AuthController < ApplicationController 
    @@users_login = {"cassidyhardin@berkeley.edu" => "its4am", 
                "ahmadjawaid@berkeley.edu" => "ajisthebest", 
                    "ahmadibrahim@berkeley.edu" => "iwanttosleep"}
    @@users_tid = {"cassidyhardin@berkeley.edu" => "123", 
                    "ahmadjawaid@berkeley.edu" => "556", 
                    "ahmadibrahim@berkeley.edu" => "789"}
    
    def login 
        email_id = params[:email]
        passward = params[:passward]
        puts email_id
        if @@users_login[:email_id] = passward
            session[:tarjimlyID] = @@users_tid[:email_id]
            if session[:tarjimlyID] > 500 
                redirect_to :controller => 'claim', :action => 'index' 
            else 
                redirect_to :controller => 'request', :action => 'index' 
            end 
        elsif !@@users_login.has_key? email_id
            puts "helllooooooooo"
            flash[:alert] = "Invalid Email! Please log in again!"
            redirect_to '/'
        else 
            session[:tarjimlyID] = @@users_tid[:email_id]
            flash[:alert] = "Invlaid Passward please try again!"
            redirect_to "/claims"
        end 
    end 
end
