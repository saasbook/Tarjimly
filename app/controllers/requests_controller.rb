class RequestsController < ActionController::Base
    def index
        @requests = Request.where(user_tarjimly_id: 1)
    end

    def show 
        rid = params[:request_id]
        @request = Request.find(rid)
    end
    
    def new
        @request = Request.new
    end
    
    def create
        #Obtain request from params
        @request = Request.new(request_params)
        
        #Add in private fields
        @request.document_format = "text" #TODO: Should be conditional based on upload
        @request.num_claims = 0
        @request.user_tarjimly_id = 1 #TODO: Should be based on auth
        @request._status = 0

        if @request.save
          flash[:notice] = "Success!"
          redirect_to requests_url
        else
          flash[:notice] = "Uh Oh!"
        end 

    end

    def delete 
        @request = Request.find(params[:rid])
        @request.destroy 
        flash[:notice] = "Your request '#{@request.title}' has been deleted!"
        redirect_to requests_url
    end

    private
    def request_params
        params.require(:request).permit(:from_language, :to_language, :deadline, :document, :document_format, :title, :description,:form_type, :categories => [])
    end
end
