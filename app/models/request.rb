class Request < ApplicationRecord
    has_many :claims, dependent: :nullify
    before_destroy :update_claims, prepend: true

    def update_claims 
        // actions to be able to nullify claims and include record of request details for dimissal by translator 
    end 
end
