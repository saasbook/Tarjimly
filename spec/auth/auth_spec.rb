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
        # response.status.should be(200)
    end
    it 'aid workers should be routed to their requests page' do 
        visit "/"
        fill_in 'Email', with: "cassihardin@gmail.com"
        fill_in 'Password', with: "tarjimlydocs19"
        click_button('Sign In')
        expect(page.current_path).to eq "/requests"
    end





    # context 'with valid email and password' do
    #   before :all do
    #     pass = Faker::Internet.password
    #     @user = create(:user, password: pass)
    #     post api_session_path, user: {email: @user.email, password: pass}, format: :json
    #   end
    #   it 'should return new token of located user' do
    #     @user.reload
    #     expect(last_response.body['user']).to be_present
    #     expect(JSON.parse(last_response.body)['user']['authentication_token']).to eq @user.authentication_token
    #     expect(JSON.parse(last_response.body)['user']['id']).to eq @user.id
    #   end
    #   it 'should have a success http status' do
    #     expect(last_response.status).to eq 200
    #   end
    # end

    # context 'with incorrect params' do
    #   before do
    #     user = create(:user)
    #     post api_session_path, user: {email: user.email, password: ''}, format: :json
    #   end
    #   it 'should assign user as nil' do
    #     expect(assigns[:user]).to be_nil
    #   end
    #   it 'should have an unauthorized http status' do
    #     expect(last_response.status).to eq 401
    #   end
    # end

  end