require 'rails_helper'
  describe 'Tarjimly Users are able to log in to ' do
    it 'should have fields to enter password and email' do 
        visit "/"
        page.should have_selector(:link_or_button, 'Login')
        page.should have_selector(:link_or_button, 'sign up')
    end

    it 'should sucessfully login translator' do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
    end

    it 'translators should be routed to their claims page' do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        expect(page.current_path).to eq "/claims"
    end

    it 'aid workers should be routed to their requests page' do 
        visit "/"
        fill_in 'email', with: "cassihardin@gmail.com"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        expect(page.current_path).to eq "/requests"
    end

    it 'unsucessful logins should be unauthorized' do 
        visit "/"
        fill_in 'email', with: "cassihardin@gmail.com"
        fill_in 'password', with: ""
        click_button('Login')
        expect(page.current_path).to eq "/"
        expect(page).to have_text("Unsucessful login, please try again.")
    end
    
    it 'after logging in, should be able to log out' do 
        visit "/"
        fill_in 'email', with: "cassihardin@gmail.com"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        page.should have_selector(:link_or_button, 'Sign Out')
        click_link('Sign Out')
        expect(page.current_path).to eq "/"
    end

  end