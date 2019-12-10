require 'rails_helper'
  describe 'Tarjimly Users are able to log in to ' do
    it 'should have fields to enter password and email' do 
        visit "/"
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_content("Tarjimly Login")
        page.should have_selector(:link_or_button, 'Sign In')
        page.should have_selector(:link_or_button, 'Sign Up')
    end

    it 'should sucessfully login translator' do 
        visit "/"
        fill_in 'Email', with: "cassidyhardin@berkeley.edu"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
    end

    it 'translators should be routed to their claims page' do 
        visit "/"
        fill_in 'Email', with: "cassidyhardin@berkeley.edu"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
        expect(page.current_path).to eq "/claims"
    end
    it 'aid workers should be routed to their requests page' do 
        visit "/"
        fill_in 'Email', with: "cassihardin@gmail.com"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
        expect(page.current_path).to eq "/requests"
    end
    it 'unsucessful logins should be unauthorized' do 
        visit "/"
        fill_in 'Email', with: "cassihardin@gmail.com"
        fill_in 'Password', with: ""
        expect(page.current_path).to eq "/"
    end

  end