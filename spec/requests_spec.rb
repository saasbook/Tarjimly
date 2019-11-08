require 'rails_helper'

describe Request do 
    it {should have_many (:claims)}
end