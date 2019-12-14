require 'spec_helper.rb'
require 'rails_helper'

describe 'Translators profile has information' do 
    before(:each) do 
        visit "/"
        fill_in 'email', with: "cassidyhardin@berkeley.edu"
        fill_in 'password', with: "tarjimlydocs19"
        click_button('Login')
        @request1 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 2, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Doctor Appointment', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request2 = Request.create(from_language: 'English', to_language: 'Arabic', _status: 1, document_format: "text", description: 'information regarding upcoming doctors appointment',  title: 'Visa Application', deadline: '2019-05-05', user_tarjimly_id: 1)
        @request1_id = @request1.id
        @request2_id = @request2.id
        @claim = Claim.create(translator_tarjimly_id: 364495, _status: 3, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request1_id)
        @claim2 = Claim.create(translator_tarjimly_id: 364495, _status: 0, submitted_date: "Nov-25-2019", translation_format: "text", request_id: @request2_id)
        @curr_id = @claim.id
        @curr2_id = @claim2.id
    end

    it 'should display name'