class RequestsController < ActionController::Base
    def index
        @user = 1
        status = params[:status] || 0

        @requests = Request.where(user_tarjimly_id: @user, _status: status)
    end

    def show 
        rid = params[:request_id]
        @request = Request.find_by_id(rid)
    end
    
    def new
        @format = params[:format] || "text"
        @request = Request.new
    end
    
    def create
        @request = Request.new(request_params)

        #TODO: should be a validation
        if @request.nil? || @request.from_language.nil? || @request.to_language.nil? || @request.description.nil? || @request.title.nil? || @request.deadline.nil? 
            redirect_to new_request_url
            return
          end

        #Add in private fields
        @request.document_format = params[:request][:format] || "text" 
        @request.user_tarjimly_id = 1 #TODO: Should be based on auth
        @request.num_claims = 0 #TODO: Should be daault in db
        @request._status = 0  #TODO: Should be daault in db

        if @request.save
          flash[:notice] = "Successfull created your request."
          redirect_to requests_url
        else
          flash[:notice] = "Uh Oh! There was an error creating your request."
        end 

    end

    def delete 
        @request = Request.find(params[:request_id])
        @request.destroy 
        flash[:notice] = "Your request '#{@request.title}' has been deleted!"
        redirect_to requests_url
    end

    private
    def request_params
        params.require(:request).permit(:from_language, :to_language, :deadline, :document, :document_format, :title, :description,:form_type, categories: [], document_uploads: [])
    end
end
