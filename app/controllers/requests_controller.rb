class RequestsController < ActionController::Base
    def index
        @user = 1
        status = params[:status] || 1

        @requests = Request.where(user_tarjimly_id: @user, _status: status)
    end

    def show 
        rid = params[:request_id]
        @request = Request.find(rid)
    end
    
    def new

    end
    
    def create
       
    end

    def delete 
        @request = Request.find(params[:rid])
        @request.destroy 
        flash[:notice] = "Your request '#{@request.title}' has been deleted!"
        redirect_to index_requests_path
    end
end
