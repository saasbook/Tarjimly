require 'spec_helper.rb'
require 'rails_helper'

describe 'Translator claiming edge cases' do 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
    end 
    it 'no claims exist' do 
        visit '/translators/requests'
        expect(page).to have_content("There are no pending requests at the moment. Please check back later!")
    end
end