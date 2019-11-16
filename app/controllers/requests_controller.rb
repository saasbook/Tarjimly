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
        @request = Request.new(request_params)
    end

    def delete 
        @request = Request.find(params[:rid])
        @request.destroy 
        flash[:notice] = "Your request '#{@request.title}' has been deleted!"
        redirect_to index_requests_path
    end

    private
    def request_params
        params.require(:request).permit(:from_language, :to_language, :deadline, :document, :document_format, :title, :description, categories: [])
    end
end
