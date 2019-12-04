class RequestsController < ApplicationController
    # before_action :authorize 
    before_action :user_auth 
    helper_method :user_auth

    def index
        @user = @userID
        @status = params[:status] || 0

        @requests = Request.where(user_tarjimly_id: @user, _status: @status)
    end

    def show 
        rid = params[:request_id]
        @request = Request.find_by_id(rid)
        if @request._status == 2
            return not_found
        end

        @claim = nil
        if @request._status == 1
            @request.claims.each do |c|
                if c._status == 1
                    @claim = c
                end
            end
        end

    end
    
    def new
        @format = params[:format] || "text"
        @request = Request.new
    end
    
    def create
        @request = Request.new(request_params)
        #TODO: should be a validation and include rest
        if @request.nil? || @request.deadline.nil?
            redirect_to new_request_url
            return
        end

        upload_format = params[:request][:format] || "text"
        if upload_format != "text"
            filename_string = @request.document_uploads.first.filename.to_s
            upload_format =  File.extname(filename_string)
            upload_format = upload_format[1..-1]
        end
        @request.document_format = upload_format

        @request.user_tarjimly_id = @userID
        @request.num_claims = 0 #TODO: Should be daault in db
        @request._status = 0  #TODO: Should be daault in db

        if @request.save
          flash[:success] = "Successfully created your request."
          redirect_to requests_url
        else
          flash[:alert] = "Uh Oh! There was an error creating your request."
        end 

    end

    def delete 
        @request = Request.find(params[:request_id])
        if @request.user_tarjimly_id != @userID
            render not_found 
        end
        
        if !@request.claims.nil? && @request.claims.present?
            @request._status = 2
            @request.save!
            @request.claims.each do |claim|
                claim._status = 3
                claim.save!
            end
        else 
            @request.destroy
        end 
        flash[:notice] = "Your request '#{@request.title}' has been deleted!"
        redirect_to requests_url
    end

    private
    def request_params
        params.require(:request).permit(:from_language, :to_language, :deadline, :document_text, :document_format, :title, :description,:form_type, categories: [], document_uploads: [])
    end
    def not_found
        render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
    def user_auth
        @userID = session[:tarjimlyID]
    end
end
