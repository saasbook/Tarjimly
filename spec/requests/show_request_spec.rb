require 'spec_helper.rb'
require 'rails_helper'

describe "User viewing their requests " do 
    # before(:each) do 
    #     @request = Request.create(1, 'English','Arabic','location_of_file',  'pdf', '25-Nov-2019', 'Camp Announcment',  'Event going on in camp','MISSING', 0,  'N/A',  0)
    # end
    it 'should be all submitted translations' do
        get "/requests"
        expect(response).to render_template(:index)
    end
    # it 'should be to see details for specific request' do
    #     get '/requests/8'

    #     expect(response).to render_template(:show)
    # end
    # @AHMAD ADD PARAMATERS FOR THE FILTERING OF REQUESTS 
    it 'should be all to see pending requests' do
        get "/requests"
        expect(response).to render_template(:index)
    end
    # @AHMAD ADD PARAMATERS FOR THE FILTERING OF REQUESTS PART 2
    it 'should be all completed requests' do
        get "/requests"
        expect(response).to render_template(:index)
    end
end