class Request < ApplicationRecord
    has_many :claims, dependent: :nullify
    before_destroy :update_claims, prepend: true do 
        throw(:abort) if self.claims.present?
    end 

    def update_claims 
        if self.claims.present?
            puts("visited helper")
            errors.add(:base, "request has existing claims")
        end 
    end 
end
