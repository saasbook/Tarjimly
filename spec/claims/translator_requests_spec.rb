require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators can view all submitted requests' do 
    before(:each) do 
        visit "/"
        fill_in 'Email', with: "cassidyhardin@berkeley.edu"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', deadline: '2019-11-05', user_tarjimly_id: 1)
        @request2 = Request.create(from_language: 'Urdu', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-07-05', user_tarjimly_id: 1, num_claims: 2)
        @request1_id = @request1.id
        @request2_id = @request2.id
    end

    it 'should have a list of all requests' do
        visit "/translators/requests"
        expect(page).to have_text("Doctor Appointment")
        expect(page).to have_text("Visa Application")
    end
    it 'should be able to filter by language' do 
        visit "/translators/requests"
        expect(page).to have_text("Document Language")  
        expect(page).to have_text("Translate To")  
        page.should have_selector(:link_or_button, 'Filter')
    end
    it 'should be able to view more details about a request' do 
        visit "/translators/requests"
        page.should have_selector(:link_or_button, 'View Request')  
    end
end