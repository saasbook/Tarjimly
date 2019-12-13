require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators dismiss claims deleted by users' do 
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
        @curr_id = @claim.id
        @curr2_id = @claim2.id
    end
    
    it 'all claims should be displayed' do
        visit "/claims"
        expect(page).to have_text("Doctor Appointment")
        expect(page).to have_text("Visa Application")
    end 
    it 'should display a warning that claimed requests have been deleted by the user' do
        visit "/claims"
        expect(page).to have_text("Requests you claimed no longer require translation. You can dismiss them below!")
    end 
    it  'should have a link to dismiss deleted requests' do 
        visit "/claims"
        page.should have_selector(:link_or_button, 'Dismiss Deleted Request')
        page.should have_selector(:link_or_button, 'Translate')
    end 

    it 'after dismissing should still be on claims page' do 
        visit "/claims"
        click_link("Dismiss Deleted Request")
        expect(page.current_path).to eq "/claims"
    end 
    it 'after dismissing claim should be gone, and all other claims still present' do 
        visit "/claims"
        click_link("Dismiss Deleted Request")
        expect(page).to have_text("Visa Application")
        expect(page).to have_no_content("Doctor Appointment")
    end 
end 

