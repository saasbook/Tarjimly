class ClaimsController < ActionController::Base
  helper_method :isHighImpact
  helper_method :isAlreadyClaimed
  helper_method :getDaysLeft

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
    @status = params[:status] || [0,1]
    @claims = Claim.where({translator_tarjimly_id: 1, _status: @status}) #TODO translator_tarjimly_id log in details
    @dismiss_claims = Claim.where({translator_tarjimly_id: 1, _status: [2, 3]})
    @total_count = Claim.where({translator_tarjimly_id: 1, _status: 1}).count
    if Claim.where({translator_tarjimly_id: 1, _status: 3}).present?
      flash[:alert] = "Requests you claimed no longer require translation. You can dismiss them below!"
    end
    if Claim.where({translator_tarjimly_id: 1, _status: 2}).present?
      flash[:alert] = "Requests you claimed have been submitted by another translator. You can dismiss them below!"
    end

  end

  def show
    cid = params[:claim_id]
    @claim = Claim.find_by_id(cid)
    if !(@claim._status -= 0 || @claim._status == 1)  #Todo check auth also
      return not_found
    end
    @request = Request.find_by_id(@claim.request_id)
  end

  def delete
    @claim = Claim.find(params[:claim_id])
    if @claim._status == 3
      @claim.destroy
      flash[:info] = "You have successfully dismissed your claim for a deleted request!"
      redirect_to claims_url
    else
      @claim.request.num_claims -= 1
      @claim.request.save!
      title = @claim.request.title
      @claim.destroy
      flash[:notice] = "You have successfully unclaimed the translation for #{title}!"
      redirect_to claims_url
    end

  end

  def complete
    begin
      ActiveRecord::Base.transaction do
        claim = Claim.find_by(id: params[:claim_id])
        claim.translation_format = "text"
        claim.translation_text = params[:claim][:translation_text]
        claim._status = 1
        claim.save!

        req = claim.request
        req.claims.each do |c|
          if c.id.to_i != params[:claim_id].to_i
            c._status = 2
            c.save!
          end
        end
        req._status = 1
        req.save!
        redirect_to claim_path(claim_id: params[:claim_id])
      end
    rescue => e
      flash[:notice] = "Uh Oh. Submission unsuccessful, please try again."
      puts e
    end
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

  def getDaysLeft(request)
    days_left = ((request.deadline - request.created_at).to_i)/86400
    if days_left == -1
      return "1 day ago", true
    elsif days_left < 0
      return (-1*days_left).to_s + " days ago", true
    elsif days_left == 0
      return "Today", true
    elsif days_left == 1
      return "1 day", true
    else
      return days_left.to_s + " days", false
    end
  end

  private
  def not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end
end

#