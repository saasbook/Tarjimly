require 'spec_helper.rb'
require 'rails_helper'

describe 'Users are able to delete their requests' do 
    before(:each) do 
        visit "/"
        fill_in 'Email', with: "cassihardin@gmail.com"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')

        @request = Request.create(from_language: 'English', to_language: 'Arabic', description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', document_text: 'pdf', deadline: '2019-05-05', user_tarjimly_id: 364494, _status: 0, num_claims: 1)
        @curr_id = @request.id
        @claim = Claim.create(translator_tarjimly_id: 1, _status: 0, translation_text: 'text', submitted_date: "Nov-25-2019", translation_format: 'pdf', request_id: @curr_id, request: @request)
        @claim_id = @claim.id
    end
    it 'user requests page should display all submitted requests' do
        visit "/requests"
        # click_link("Completed Translations")
        expect(page).to have_text("Doctor Appointment")
    end 
    it 'should have a delete button' do
        visit "/requests/#{@curr_id}"
        page.should have_selector(:link_or_button, 'Delete Request')
    end 
    it  'deleting request should redirect back to index page' do 
        visit "/requests/#{@curr_id}"
        click_button("Delete Request")
        expect(page.current_path).to eq "/requests"
    end 
    it 'display flash message confirming deltion' do 
        visit "/requests/#{@curr_id}"
        click_button("Delete Request")
        expect(page).to have_text("Your request 'Doctor Appointment' has been deleted!")
    end 
    it 'after refreshing page, request should be gone' do 
        visit "/requests/#{@curr_id}"
        click_button("Delete Request")
        visit "/requests"
        expect(page).to have_no_content("Doctor Appointment")
    end 
    it 'claimed request should not fully delete' do 
        @request.id = @curr_id
        visit "/requests/#{@curr_id}"
        @request.claims.equal? @claim
        click_button("Delete Request")
        expect(@request.reload._status).to equal(2)
    end 

    it 'all associated claims should have updated status' do
        @request.id = @curr_id
        visit "/requests/#{@curr_id}"
        @request.claims.equal? @claim
        click_button("Delete Request")
        expect(@claim.reload._status).to equal(3)
    end

    it 'has associated claims will raise error stoping complete destroy' do 
        @request.id = @curr_id
        visit "/requests/#{@curr_id}"
        expect { @request.destroy }.to raise_error
    end
end 

