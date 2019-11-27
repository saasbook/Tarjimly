class ClaimsController < ActionController::Base
  def requests
    @user = 1
    if params.has_key?(:from_language)
      @requests = Request.where(:from_language => params[:from_language].capitalize, :to_language => params[:to_language].capitalize)
    else
      @requests = Request.all
    end
    @requests = @requests.sort_by{ |r| [r.deadline, r.num_claims]} unless !params.has_key?(:sort_by_deadline)
  end

  def preview
    @claim = Claim.new
    @user = 1
    @request = Request.find_by(:id => params[:request_id])
  end

  def create
    claim = Claim.create(translator_tarjimly_id: params[:translator_tarjimly_id], _status: params[:_status], request_id: params[:request_id])
    @request = Request.find_by(:id => params[:request_id])
    get_high_impact_requests_msg(@request)
    render "requests/show"
  end

  def index
    @claims = Claim.where({translator_tarjimly_id: 1, _status: [0, 1]}) #TODO translator_tarjimly_id log in details 
    @deleted_claims = Claim.where({translator_tarjimly_id: 1, _status: 3})
    if @deleted_claims.present?
      flash[:notice] = "Requests you claimed no longer require translation. You can dismiss them below!"
    end

  end

  def show

  end

  def delete
    @claim = Claim.find(params[:claim_id])
    if @claim._status == 3
      @claim.destroy 
      flash[:notice] = "You have sucessfully dismissed your claim for a deleted request!"
      redirect_to claims_url
    # else 
    #   @claim.request.num_claims -= 1
    #   @claim.destroy 
    #   flash[:notice] = "You have sucessfully unclaimed this translation!"
    #   redirect_to claims_url
    end

  end

  def complete

  end

  private
  def get_high_impact_requests_msg(claimed_request)
    high_impact_requests = Request.where(from_language: claimed_request.from_language, to_language: claimed_request.to_language, num_claims: 0)
    @high_impact_msg = ""
    if !high_impact_requests.empty?
      # flash[:notice] = "There are other requests of the same languages with no claims."
      @high_impact_msg = "There are other requests of the same languages with no claims."
    end
  end

end
