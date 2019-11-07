# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
requests_seed = [{:user_tarjimly_id => 1, :from_language => "English", :to_language => "Arabic", :document => "location_of_file", :document_type => "pdf", :deadline  => "25-Nov-2019",
            :title => "Camp Announcment", :description => "Event going on in camp", :categories => ['Refugee Camp', 'Event'], :num_claims => 0},
            {:user_tarjimly_id => 1, :from_language => "English", :to_language => "Urdu", :document => "location_of_file", :document_type => "pdf", :deadline  => "25-Nov-2019",
            :title => "Camp Announcment", :description => "Event going on in camp", :categories => ['Refugee Camp', 'Event'], :num_claims => 0},
            {:user_tarjimly_id => 2, :from_language => "Arabic", :to_language => "Urdu", :document => "location_of_file", :document_type => "jpg", :deadline  => "25-Dec-2019",
            :title => "Visa Application", :description => "Information for steps in visa application", :categories => ['Visa', 'Legal'], :num_claims => 0}
            {:user_tarjimly_id => 3, :from_language => "Urdu", :to_language => "English", :document => "location_of_file", :document_type => "png", :deadline  => "15-Nov-2019",
            :title => "Governement Forms", :description => "Governemnt forms regarding family dependencies", :categories => ['Government', 'Forms'], :num_claims => 0}
            {:user_tarjimly_id => 4, :from_language => "English", :to_language => "Arabic", :document => "location_of_file", :document_type => "pdf", :deadline  => "01-Jan-2020",
            :title => "Doctor Notes", :description => "Notes from recent Doctors visit", :categories => [], :num_claims => 0}, 
            {:user_tarjimly_id => 5, :from_language => "English", :to_language => "Arabic", :document => "location_of_file", :document_type => "pdf", :deadline  => "25-Dec-2019",
            :title => "Lawyer Meeting", :description => "Times to schedulue upcoming appointment", :categories => ['Legal'], :num_claims => 0}
        ]

claims_seed = [{:translator_tarjimly_id => 1, :request_id => 1, :status => 0, :submitted_date => "N/A", :translation => "location_of_file", :translation_type => "pdf"},
            {:translator_tarjimly_id => 3, :request_id => 1, :status => 0, :submitted_date => "6-Nov-2019", :translation => "location_of_file", :translation_type => "text"},
            {:translator_tarjimly_id => 3, :request_id => 2, :status => 1, :submitted_date => "N/A", :translation => "location_of_file", :translation_type => "pdf"},
            {:translator_tarjimly_id => 2, :request_id => 2, :status => 2, :submitted_date => "N/A", :translation => "location_of_file", :translation_type => "pdf"},
            {:translator_tarjimly_id => 5, :request_id => 5, :status => 0, :submitted_date => "N/A", :translation => "location_of_file", :translation_type => "pdf"}
]


requests_seed.each do |r|
    Request.create!(r)
end

claims_seed.each do |c|
    Claim.create!(c)
end