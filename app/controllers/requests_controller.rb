class RequestsController < ApplicationController
    before_action :authorize 
    helper_method :getDaysLeft, :current_user, :format_id  
    def index
        @name = session[:name]
        @role = session[:role]
        @status = params[:status] || [0, 1]
        @requests = Request.where(user_tarjimly_id: @userID, _status: @status)
        @total_count = Request.where(user_tarjimly_id: @userID, _status: [0,1]).count
    end

    def show 
        rid = params[:request_id]
        @request = Request.find_by_id(rid)
        if @request.nil? || @request.user_tarjimly_id != @userID || @request._status == 2
            flash[:alert] = "You are not authorized to view this request!"
            redirect_to requests_url
            return
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
        @request.deadline = @request.deadline.time.in_time_zone("UTC")
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
        elsif !@request.claims.nil? && @request.claims.present?
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

    def getDaysLeft(request)
        days_left = ((request.deadline.time.in_time_zone(session[:time_zone]) - request.created_at.time.in_time_zone(session[:time_zone])).to_i)/86400
        if days_left < 0
            return (-1*days_left).to_s + " days ago", true
        else
            return days_left.to_s + " days", false
        end
    end
    def format_id(s)
        s_list = s.downcase.split(" ")
        new_s = ""
        s_list.each do |i|
            new_s += "_#{i}"
        end
        return new_s
    end
    
    def authorize
        if @userID.present?
            return
        elsif session[:tarjimlyID].nil?
          flash[:alert] = "You must be logged into view this page"
          redirect_to '/auth' 
        elsif session[:role] == "Translator"
          flash[:alert] = "You must be authorized to view this page"
          redirect_to claims_path
        else 
          @userID = session[:tarjimlyID] 
        end
      end

    private
    def request_params
        params.require(:request).permit(:from_language, :to_language, :deadline, :document_text, :document_format, :title, :description,:form_type, categories: [], document_uploads: [])
    end
    def not_found
        render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
end
