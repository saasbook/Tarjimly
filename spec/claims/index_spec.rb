require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators profile has information' do 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 2, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request2 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 1, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request1_id = @request1.id
        @request2_id = @request2.id
        @claim = Claim.create(translator_tarjimly_id: 364495, _status: 3, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request1_id)
        @claim2 = Claim.create(translator_tarjimly_id: 364495, _status: 0, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request2_id)
        @claim3 = Claim.create(translator_tarjimly_id: 364495, _status: 7, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request2_id)

        @curr_id = @claim.id
        @curr2_id = @claim2.id
        @curr3_id = @claim3.id
    end

    it 'should display profile information' do 
        visit "claims"
        expect(page).to have_content("Cass Hardin")
        expect(page).to have_content("Translator")
        expect(page).to have_content("Completed Translations: 0")
    end
    it 'restrict access to only translator pages' do 
        visit "requests"
        expect(page).to have_content("You must be authorized to view this page")
        expect(page.current_path).to eq "/claims"
    end
    it 'should not be able to view claims not belonging to me' do 
        visit "claims/6865"
        expect(page).to have_content("You are not authorized to view this claim.")
        expect(page.current_path).to eq "/claims"
    end
    it 'claims with in valid status should not have pages' do 
        visit "claims/#{@curr3_id}"
        expect(page).to have_content("You are not authorized to view this claim.")
    end
end
