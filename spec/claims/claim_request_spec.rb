require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators can claim requests' do 
    before(:each) do 
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', description: 'information regarding upcoming doctors appointment', document_format: "text", title: 'Doctor Appointment', deadline: '2019-05-05', user_tarjimly_id: 1, num_claims: 0)
        @request2 = Request.create(from_language: 'English', to_language: 'Arabic', description: 'information regarding upcoming doctors appointment', document_format: "text", title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1,  num_claims: 2)
        @request1_id = @request1.id
        @request2_id = @request2.id
    end
    
    it 'should have option to claim request' do
        visit "/translators/requests/#{@request1_id}"
        page.should have_selector(:link_or_button, 'Claim')
    end 

    it 'should route to all claims after viewing' do 
        visit "/translators/requests/#{@request1_id}"
        click_on 'Claim'
        expect(page.current_path).to eq "/claims"
    end 

    it 'should display confirmation message for successfully claimed request' do
        visit "/translators/requests/#{@request1_id}"
        click_on 'Claim'
        # expect(page).to have_text("You have successfully claimed Doctor Appointment Translation")
    end

    it 'claimed page should have new claim' do 
        visit "/translators/requests/#{@request1_id}" 
        click_on 'Claim'
        visit "/claims"
        expect(page).to have_text("Doctor Appointment")
        page.should have_selector(:link_or_button, 'Translate')
    end 

    it 'all requests should not show requests which have been claimed' do 
        visit "/translators/requests/#{@request1_id}"
        click_on 'Claim'
        visit "/translators/requests"
        expect(page).to have_no_content("Doctor Appointment")
    end 

    # it 'will fail if there are more than 2 existing claims' do
    #     visit "/translators/requests/#{@request2_id}"
    #     click_on 'Claim'
    #     expect(page.current_path).to eq "/translators/requests"
    #     expect(page).to have_text("You were unable to Claim Visa Application, please claim another translation")
    # end
end