class Request < ApplicationRecord
    has_many :claims
    before_destroy :update_claims, prepend: true
    has_many_attached :document_uploads

    def update_claims 
        if !self.claims.nil? && self.claims.present?
            self._status = 2
            self.claims.each do |claim|
                claim._status = 3
            end
            return false 
        end 
    end 
end
