class Request < ApplicationRecord
    has_many :claims, dependent: :nullify
    has_many_attached :document_uploads
    before_destroy :update_claims, prepend: true do 
        throw(:abort) if errors.present?
    end 

    def update_claims 
        if self.claims.present?
            errors.add(:base, "request has existing claims")
        end 
    end 
end
