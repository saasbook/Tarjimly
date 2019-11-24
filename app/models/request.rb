class Request < ApplicationRecord
    has_many :claims, dependent: :nullify
    before_destroy :update_claims, prepend: true

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
