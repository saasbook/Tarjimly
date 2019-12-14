require 'rails_helper'
  describe 'Requires Authentication To View Pages ' do
    it 'cannot view translator claims if not logged in' do 
        visit "claims"
        expect(page.current_path).to eq "/"
    end

    it 'cannot view requests if not logged in' do 
        visit "requests"
        expect(page.current_path).to eq "/"
    end


end