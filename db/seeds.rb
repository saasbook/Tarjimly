# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
requests_seed = [{user_tarjimly_id: 1, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                  title: 'Camp Announcment', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 1, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                      title: 'University Application', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'University Application', _status: 0}
]


requests_seed.each do |r|
  Request.create(r)
end
