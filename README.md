# README

[![Maintainability](https://api.codeclimate.com/v1/badges/9c4dc71cb58527d700bd/maintainability)](https://codeclimate.com/github/cassidyhardin/TarjimlyDocs/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/9c4dc71cb58527d700bd/test_coverage)](https://codeclimate.com/github/cassidyhardin/TarjimlyDocs/test_coverage)

[![Build Status](https://travis-ci.com/cassidyhardin/TarjimlyDocs.svg?branch=master)](https://travis-ci.com/cassidyhardin/TarjimlyDocs)

## TarjimlyDocs

TarjimlyDocs provides refugees, and aid workers a platform where they can upload documents to be connected with our volunteer translators, who are able to claim translations and perform translations from anywhere around the world. 

### System dependencies

Our app has been built in Ruby on Rails, with postgrsql and yarn. Please ensure you have the following versions.

`ruby 2.6.3`

`rails 6.0.0`

`npm 6.9.0`

`node 10.16.3`

`npm install node@10.16.3`

`yarn 1.21.1`

`brew install postgresql`

`brew services start postgresql`

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

### Accessibility Testing 

Accessibility testing can be performed across TarjimlyDocs. We are constantly improving our code to be more accessible to all users! 

`axe http://localhost:3000/`

Rspec Integration testing for accessibility can be found within `spec/accessibility_spec.rb` 


### Deployment

Our app is deployed in heroku, and can be accessed at [http://tarjimly-docs.herokuapp.com/](http://tarjimly-docs.herokuapp.com/) however you are also able to run it locally 

`rails server`

### Contibutors 
Ahmad Jawaid 

Cassidy Hardin 

Ahmad Ibrahim 

Ken Opamurataqongse

Mariam Abughosh

Brandon Scolieri

Arda Sozer
