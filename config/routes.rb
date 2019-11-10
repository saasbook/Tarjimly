Rails.application.routes.draw do

  get '/login' => 'appliscation#login', :as => 'application_login'
  get '/users/:uid/requests' => 'requests#index', :as => 'index_requests'
  get '/users/:uid/requests/:request_id' => 'requests#show', :as => 'show_request'
  get '/users/:uid/requests/new' => 'requests#new', :as => 'new_request'
  post '/users/:uid/requests' => 'requests#create', :as => 'create_request'
  delete '/users/:uid/requests/:request_id' => 'requests#delete', :as => 'delete_request'


  get '/translators/requests' => 'claims#requests', :as => 'view_requests'
  get '/translators/requests/:request_id' => 'claims#preview', :as => 'preview_request'
  get '/translators/:tid/claims' => 'claims#index', :as => 'index_claims'
  get '/translators/:tid/claims/:claim_id' => 'claims#show', :as => 'show_claim'
  post '/translators/:tid/claims' => 'claims#create', :as => 'create_claim'
  delete '/translators/:tid/claims/:claim_id' => 'claims#delete', :as => 'delete_claim'
  patch '/translators/:tid/claims/:claim_id' => 'claims#complete', :as => 'complete_claim'
  
  root 'requests#index'

end
