class ClaimsController < ActionController::Base
  helper_method :isHighImpact
  helper_method :isAlreadyClaimed

  def requests
    @claim = Claim.new
    claimed_ids = Claim.where(translator_tarjimly_id: 1).pluck(:request_id)
    @user = 1
    if params.has_key?(:from_language)
      @requests = Request.where(:from_language => params[:from_language].capitalize, :to_language => params[:to_language].capitalize).where.not(id: claimed_ids)
    else
      @requests = Request.where.not(id: claimed_ids)
    end
    @requests = @requests.sort_by{ |r| [r.deadline, r.num_claims]}
  end

  def preview
    @claim = Claim.new
    @user = 1
    @request = Request.find_by(:id => params[:request_id])
    @all_requests = Request.all
  end

  def create
    # @claim = Claim.new
    begin
      ActiveRecord::Base.transaction do
        Claim.create(translator_tarjimly_id: 1, _status: 0, request_id: params[:request_id]) #TODO: Translator should be based on auth, status should be default
        req =  Request.find_by(id: params[:request_id])
        req.num_claims = req.num_claims + 1
        req.save
      end
    rescue => e
      flash[:notice] = "Uh Oh. Something went wrong, please try again."
      redirect_to view_requests_url
    end
    redirect_to claims_url
  end

  def index
    @claims = Claim.where({translator_tarjimly_id: 1, _status: [0, 1]}) #TODO translator_tarjimly_id log in details 
    @deleted_claims = Claim.where({translator_tarjimly_id: 1, _status: 3})
    if @deleted_claims.present?
      flash[:notice] = "Requests you claimed no longer require translation. You can dismiss them below!"
    end

  end

  def show
    @claim = Claim.find_by_id(params[:claim_id])
  end

  def delete
    @claim = Claim.find(params[:claim_id])
    if @claim._status == 3
      @claim.destroy 
      flash[:notice] = "You have sucessfully dismissed your claim for a deleted request!"
      redirect_to claims_url
    else 
      @claim.request.num_claims -= 1
      @claim.request.save!
      title = @claim.request.title
      @claim.destroy 
      flash[:notice] = "You have sucessfully unclaimed the translation for #{title}!"
      redirect_to claims_url
    end

  end

  def complete

  end

  def isHighImpact(from_lang, to_lang, req_id)
    high_impact_requests = Request.where(from_language: from_lang, to_language: to_lang, num_claims: 0).where.not(id: req_id)
    if Request.find_by_id(req_id).num_claims == 0
      return true
    end
    return high_impact_requests.empty?
  end

  #TODO: Should be a validation also
  def isAlreadyClaimed(req_id)
    return !Claim.where({translator_tarjimly_id: 1, request_id: req_id}).empty? #TODO: Auth
  end

end
