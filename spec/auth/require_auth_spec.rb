require 'rails_helper'
  describe 'Requires Authentication To View Pages ' do
    it 'cannot view translator claims if not logges in' do 
        visit "claims"
        expect(page).to have_content("You must be logged into view this page")
        page.should have_sselector(:link_or_button, 'sign up')
    end

    # it 'should sucessfully login translator' do 
    #     visit "/"
    #     fill_in 'email', with: "cassidyhardin@berkeley.edu"
    #     fill_in 'password', with: "tarjimlydocs19"
    #     click_button('Login')
    #     expect(page.status_code).to eq(200)
    # end
end