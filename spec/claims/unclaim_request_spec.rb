require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators are able to unclaim translation requests' do 
    before(:each) do 
        @request = Request.create(from_language: 'English', to_language: 'Arabic', document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Passport Application', document_text: 'pdf', deadline: '2019-05-05', user_tarjimly_id: 1, _status: 1, num_claims: 1)
        @curr_id = @request.id
        @claim = Claim.create(translator_tarjimly_id: 1, _status: 0, translation_text: 'text', submitted_date: "Nov-25-2019", translation_format: 'pdf', request_id: @curr_id, request: @request)
        @claim_id = @claim.id
    end
    it 'should have an unclaim button on the details page' do 
        visit "/claims/#{@claim_id}"
        page.should have_selector(:link_or_button, 'Unclaim Request')
    end 
    it 'should return to all claims page after unclaiming' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
    end 
    it 'should return to all claims page after unclaiming' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
        expect(page.current_path).to eq "/claims"
    end 
    it 'should have confirmation of deltion message' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
        expect(page).to have_text("You have sucessfully unclaimed the translation for Passport Application!")
    end 
    it 'claim should not be present after deleting' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
        visit "/claims"
        expect(page).to have_no_content("Passport Application")
    end 
    it 'should be able to reclaim from translator requests page after unclaiming' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
        visit "/translators/requests"
        expect(page).to have_text("Passport Application")
    end 
    it 'number of claims for the request should have decreased' do 
        visit "/claims/#{@claim_id}"
        click_button("Unclaim Request")
        expect(@request.reload.num_claims).to equal(0)
    end
end
    
