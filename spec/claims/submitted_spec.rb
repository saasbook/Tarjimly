require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators dismiss claims deleted by users' do 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 2, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request2 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 1, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1, num_claims: 2)
        @request3 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 1, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1)

        @request1_id = @request1.id
        @request2_id = @request2.id
        @request3_id = @request3.id
        @claim3 = Claim.create(translator_tarjimly_id: 3, _status: 1, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request2_id)

        @claim2 = Claim.create(translator_tarjimly_id: 364495, _status: 2, submitted_date: "N/A", translation_format: "text", request_id: @request2_id)
        @curr2_id = @claim2.id
    end
    it  'should have a link to dismiss submitted translations' do 
        visit "/claims"
        page.should have_selector(:link_or_button, 'Dismiss Deleted Request')
    end 
    it 'after dismissing should still be on claims page' do 
        visit "/claims"
        click_link("Dismiss Deleted Request")
        expect(page.current_path).to eq "/claims"
    end 
    it 'and translations submitted by someone else' do
        visit "/claims"
        expect(page).to have_content("Requests you claimed have been submitted by another translator. You can dismiss them below!") 
    end
end 

