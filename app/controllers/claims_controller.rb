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
    # @deleted_requests = Claim.where.(request_id: nil)

  end

  def show

  end

  def delete

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
