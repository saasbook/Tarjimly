require 'spec_helper.rb'
require 'rails_helper'

describe "User viewing details for a specific request" do 
    before(:each) do 
        @request = Request.create(from_language: 'English', to_language: 'Arabic', description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', document_format: 'pdf', deadline: '2019-05-05', user_tarjimly_id: 1)
        @curr_id = @request.id
        @request_deleted = Request.create(from_language: 'English', to_language: 'Arabic', description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', document_format: 'pdf', deadline: '2019-05-05', user_tarjimly_id: 1, _status: 2)
        @curr_id_deleted = @request_deleted.id
    end
    it 'should be all submitted translations' do
        get "/requests"
        expect(response).to render_template(:index)
    end
    it 'should be to see details for specific request' do
        get "/requests/#{@curr_id}"
        expect(response).to render_template(:show)
    end

    it 'should be able to return back too all requests' do 
        visit "/requests/#{@curr_id}"
        page.should have_selector(:link_or_button, 'All Requests')
    end

    it 'clicking all requests wil redirect to index page' do 
        visit "/requests/#{@curr_id}"
        click_link("Back to All Requests")
        expect(page.current_path).to eq "/requests"
    end 

    it 'should have infotmation about the specifics of the request' do 
        visit "/requests/#{@curr_id}"
        expect(page).to have_content("English")
        expect(page).to have_content("Arabic")
        expect(page).to have_content("information regarding upcoming doctors appointment")
    end
    it 'for deleted request should redirect to error page' do 
        visit "/requests/#{@curr_id_deleted}"
        page.should have_content("The page you were looking for doesn't exist.")
    end
    it 'if request was deleted response should be 404' do 
        visit "/requests/#{@curr_id_deleted}"
        expect(page.status_code).to eq(404)
    end
end