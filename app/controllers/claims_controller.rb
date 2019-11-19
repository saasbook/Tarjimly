class ClaimsController < ActionController::Base
  def requests
    if params.has_key?(:from_language)
      @requests = Request.where(:from_language => params[:from_language].capitalize, :to_language => params[:to_language].capitalize)
    else
      @requests = Request.all
    end
    @requests = @requests.sort_by{ |r| [r.deadline, r.num_claims]} unless !params.has_key?(:sort_by_deadline)
  end

  def preview

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

end
