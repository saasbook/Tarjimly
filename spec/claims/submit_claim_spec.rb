require 'spec_helper.rb'
require 'rails_helper'

describe 'About to translate' do 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        @request = Request.create(from_language: 'English', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Passport Application', document_text: 'pdf', deadline: '2019-05-05', user_tarjimly_id: 1, _status: 1, num_claims: 1)
        @curr_id = @request.id
        @claim = Claim.create(translator_tarjimly_id: 364495, _status: 0, translation_text: 'text', submitted_date: "Nov-25-2019", translation_format: 'pdf', request_id: @curr_id, request: @request)
        @claim_id = @claim.id
    end
    it 'should have a submit translation on the details page' do 
        visit "/claims/#{@claim_id}"
        page.should have_selector(:link_or_button, 'Submit Translation')
    end 
    it 'should let me submit' do 
        visit "/claims/#{@claim_id}"
        fill_in 'claim_translation_text', with: 'Rspec Translation Test Submission'
        click_button("Submit Translation")
        expect(page).to have_current_path("/claims/#{@claim_id}")          
        # expect(page).to have_content('Completed') 
    end 
    
    # it 'claim should not be present after deleting' do 
    #     visit "/claims/#{@claim_id}"
    #     click_button("Unclaim Request")
    #     visit "/claims"
    #     expect(page).to have_no_content("Passport Application")
    # end 
    # it 'should be able to reclaim from translator requests page after unclaiming' do 
    #     visit "/claims/#{@claim_id}"
    #     click_button("Unclaim Request")
    #     visit "/translators/requests"
    #     expect(page).to have_text("Passport Application")
    # end 
    # it 'number of claims for the request should have decreased' do 
    #     visit "/claims/#{@claim_id}"
    #     click_button("Unclaim Request")
    #     expect(@request.reload.num_claims).to equal(0)
    # end
end
    
