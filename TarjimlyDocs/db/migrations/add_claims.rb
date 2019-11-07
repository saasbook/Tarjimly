class CreateClaim < ActiveRecord::Migration
    def create_claim 
        create_table :claims do |t|
            t.int :translator_tarjimly_id
            t.references 'requests'
            t.int :_status 
            t.datetime :submitted_date
            t.string :translation 
            t.string :translation_type
            t.timestamps
        end
    end
end