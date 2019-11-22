class Request < ApplicationRecord
    has_many :claims
    before_destroy :update_claims, prepend: true

    def update_claims 
        if @request.claims.present?
            @request._status = 2
            return false 
        end 
    end 
end
