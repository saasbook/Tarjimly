# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
requests_seed = [{user_tarjimly_id: 1, from_language: 'English', to_language: 'Arabic', document_text: 'His next patient was a Farsi-speaking man who was in severe pain. The doctor, unable to communicate with the patient directly or to reach an on-the-ground-translator provided by the NGO, had a difficult decision to make: ask the ailing patient to wait in a long queue or use the Tarjimly app.
                  As he opted to use the translating app, the doctor was immediately connected to a Tarjimly translator on a phone call. Through the conversation with the doctor, the patient, and the translator, they discovered that the patient suffered from severe kidney and stomach pains due to kidney stones.
                  With this information on hand, the doctor quickly searched for the patient’s medical history. He found that the man had an appointment scheduled earlier in the day for the same pain, but at another clinic. As they gathered additional information, the Tarjimly translator asked the patient if he had come in for his previous appointment.
                  From the patient’s explanation, they learned that he had indeed checked in for his appointment at the first clinic. Unfortunately, because there was no Farsi-speaking translator available, the patient was forced to return home without any help or medication.
                  With the translator.', document_format: 'text', deadline: '25-Nov-2019',
                  title: 'Doctor Appointment Notes', description: 'These are notes for a refugee with information about their recent doctors visit. Important instructions regarding post appointment care they will need to complete. ', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                  {user_tarjimly_id: 1, from_language: 'Urdu', to_language: 'English', document_text: 'Most Common Forms for a U.S. Passport
                    You may fill out these forms using an online Form Filler or by downloading a PDF of the application. The Form Filler tool is a shared resource for 4 of our forms. Its common to enter your information and see a different form than you expected (for example, a DS-11 instead of a DS-82). The Form Filler will create the correct form for you based on the information you enter.
             
                    The Form Filler works best if you are applying for or renewing your U.S. passport in the United States or renewing by mail from Canada. If you need to apply for or renew your U.S. passport in another country, visit the webpage of the U.S. embassy or consulate in that country for more information. 
                     
                    1. Application For A U.S. Passport (DS-11) 
                    You should complete this form if you are applying for the first time, you are applying for your child who is under age 16, or you don not meet our requirements to renew your passport.t', document_format: 'text', deadline: '15-Nov-2019',
                    title: 'Passport Forms', description: 'Necessary forms a refugee will need to gather to complete their passport application. Details regarding the next steps they will need to complete to finalize their passport application to be able to join their family in the United States!', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'Passport Application', _status: 0},
                 
                  {user_tarjimly_id: 7, from_language: 'English', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                  title: 'Camp Announcment', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'Arabic', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                  title: 'Visa Application', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'Visa Application', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'Urdu', to_language: 'English', document_text: 'this is the document text', document_format: 'text', deadline: '15-Nov-2019',
                  title: 'Governement Forms', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 4, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '01-Jan-2020',
                  title: 'Doctor Notes', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 5, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                  title: 'Lawyer Meeting', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                    title: 'Camp Event', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'English', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                    title: 'Doctor Appointment', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'Arabic', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                    title: 'Visa Request', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'Visa Application', _status: 0},
                 
                  {user_tarjimly_id: 1, from_language: 'Urdu', to_language: 'English', document_text: 'Most Common Forms for a U.S. Passport
                    You may fill out these forms using an online Form Filler or by downloading a PDF of the application. The Form Filler tool is a shared resource for 4 of our forms. Its common to enter your information and see a different form than you expected (for example, a DS-11 instead of a DS-82). The Form Filler will create the correct form for you based on the information you enter.
             
                    The Form Filler works best if you are applying for or renewing your U.S. passport in the United States or renewing by mail from Canada. If you need to apply for or renew your U.S. passport in another country, visit the webpage of the U.S. embassy or consulate in that country for more information. 
                     
                    1. Application For A U.S. Passport (DS-11) 
                    You should complete this form if you are applying for the first time, you are applying for your child who is under age 16, or you don not meet our requirements to renew your passport.t', document_format: 'text', deadline: '15-Nov-2019',
                    title: 'Passport Forms', description: 'Necessary forms a refugee will need to gather to complete their passport application. Details regarding the next steps they will need to complete to finalize their passport application to be able to join their family in the United States!', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'Passport Application', _status: 0},
                 
                  {user_tarjimly_id: 4, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '01-Jan-2020',
                    title: 'Marriage License', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'Marriage License', _status: 0},
                 
                  {user_tarjimly_id: 5, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                    title: 'University Diploma', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 3, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                      title: 'University Application', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'University Application', _status: 0},
                 
                  {user_tarjimly_id: 4, from_language: 'English', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                      title: 'Doctor Meeting Confirmation', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 2, from_language: 'Arabic', to_language: 'Urdu', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                      title: 'School Enrollment', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'School Enrollment', _status: 0},
                 
                  {user_tarjimly_id: 3, from_language: 'Urdu', to_language: 'English', document_text: 'this is the document text', document_format: 'text', deadline: '15-Nov-2019',
                      title: 'Governement Notice', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 4, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '01-Jan-2020',
                      title: 'Medical Note', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 5, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Dec-2019',
                      title: 'Lawyer Meeting', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0}
=======
requests_seed = [{user_tarjimly_id: 1, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                  title: 'Camp Announcment', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'N/A', _status: 0},
                 
                  {user_tarjimly_id: 1, from_language: 'English', to_language: 'Arabic', document_text: 'this is the document text', document_format: 'text', deadline: '25-Nov-2019',
                      title: 'University Application', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', categories: ['Legal', 'Medical'], num_claims: 0, form_type: 'University Application', _status: 0}
>>>>>>> 4b0161e5ce30e7596a6f3d701f8a21cd9b3d14a3
]


requests_seed.each do |r|
  Request.create(r)
end
