class Request < ApplicationRecord
    has_many :claims, dependent: :nullify
    has_many_attached :document_uploads
end
