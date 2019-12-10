# README

[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/test_coverage)](https://codeclimate.com/github/codeclimate/codeclimate/test_coverage)

[![Build Status](https://travis-ci.com/cassidyhardin/TarjimlyDocs.svg?branch=master)](https://travis-ci.com/cassidyhardin/TarjimlyDocs)

## TarjimlyDocs

TarjimlyDocs provides refugees, and aid workers a platform where they can upload documents to be connected with our volunteer translators, who are able to claim translations and perform translations from anywhere around the world. 

### System dependencies

Our app has been built in Ruby on Rails, with postgrsql

`ruby 2.6.3`

`rails 6.0.0`

`brew install postgresql`

`brew start sql`

To ensure our program will execute correctly ensure you have the right versions, and necessary gems installed 

`rvm gemset empty`

`gem install bundler`

`bundle install`

### Database creation and initialization

`rake db:create`

`rake db:migrate`

`rake db:seed`

### **How to run the test suite**

`bundle exec rake` 

Will execute all tests in both cucumber and rspec 

`cucumber` 

features tests 

`rspec` 

unit testing of features 

**Accessibility Testing **

Accessibility testing can be performed across TarjimlyDocs. We are constantly improving our code to be more accessible to all users! 

`axe http://localhost:3000/`

Rspec Integration testing for accessibility can be found within `spec/accessibility_spec.rb` 


### Deployment

Our app is deployed in heroku, and can be accessed at [http://heroku.com/tarjimlydocs](http://heroku.com/tarjimlydocs) however you are also able to run it locally 

`rails server`

### Contibutors 
Ahmad Jawaid 
Cassidy Hardin 
Ahmad Ibrahim 
Ken Opamurataqongse
Brandon Scolieri
Arda Sozer
Mariam Abughosh
