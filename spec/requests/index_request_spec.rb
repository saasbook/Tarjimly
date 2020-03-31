require 'spec_helper.rb'
require 'rails_helper'

describe "User viewing their requests " do 
    # @AHMAD ADD PARAMATERS FOR THE FILTERING OF REQUESTS 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassihardin@gmail.com"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
    end 

    it 'should be all to see pending requests' do
        visit "/requests"
        # expect(response).to render_template(:index)
    end
    #   @AHMAD ADD PARAMATERS FOR THE FILTERING OF REQUESTS PART 2
    it 'should be all completed requests' do
        visit "/requests"
        # expect(response).to render_template(:index)
    end

end