class ClaimsController < ActionController::Base
  helper_method :isHighImpact
  helper_method :isAlreadyClaimed

  def requests
    @user = 1
    if params.has_key?(:from_language)
      @requests = Request.where(:from_language => params[:from_language].capitalize, :to_language => params[:to_language].capitalize)
    else
      @requests = Request.all
    end
    @requests = @requests.sort_by{ |r| [r.deadline, r.num_claims]}
  end

  def preview
    @claim = Claim.new
    @user = 1
    @request = Request.find_by(:id => params[:request_id])
  end

  def create
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
    if @dexsleted_claims.present?
      flash[:notice] = "Requests you claimed no longer require translation. You can dismiss them below!"
    end

  end

  def show
    cid = params[:claim_id]
    @claim = Claim.find_by_id(cid)
    puts "STATUS INCOMING: #{@claim._status}"
    if !(@claim._status -= 0 || @claim._status == 1)  #Todo check auth also
      return not_found
    end 
    @request = Request.find_by_id(@claim.request_id)
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

  def isHighImpact(from_lang, to_lang, req_id)
    high_impact_requests = Request.where(from_language: from_lang, to_language: to_lang, num_claims: 0).where.not(id: req_id)
    return high_impact_requests.empty?
  end

  #TODO: Should be a validation also
  def isAlreadyClaimed(req_id)
    return !Claim.where({translator_tarjimly_id: 1, request_id: req_id}).empty? #TODO: Auth
  end

  private
  def not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

end
