require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators can preview a request before claiming' do 
    before(:each) do 
        visit "/"
        fill_in 'Email', with: "cassidyhardin@berkeley.edu"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request2 = Request.create(from_language: 'English', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request1_id = @request1.id
        @request2_id = @request2.id
    end

    it 'should display details for the request' do 
        visit "translators/requests"
        expect(page).to have_content("Doctor Appointment") 
        expect(page).to have_content("Visa Application")
        page.first(:link, "View Request").click
    end 

    it 'should be able to claim a request' do 
        visit "translators/requests"
        page.first(:link, "View Request").click 
        expect(page.current_path).to eq "/translators/requests/#{@request1_id}"
    end 

    it 'should return to all requests after viewing' do 
        visit "/translators/requests/#{@request1_id}"
        page.should have_selector(:link_or_button, 'Back to All Requests')
        click_link("Back to All Requests")
        expect(page.current_path).to eq "/translators/requests"
    end
end 