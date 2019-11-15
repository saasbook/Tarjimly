Rails.application.routes.draw do

  #Login
  get '/login' => 'application#login', :as => 'application_login'

  #User Pages
  get '/requests' => 'requests#index', :as => 'index_requests'
  get '/requests/:request_id' => 'requests#show', :as => 'show_request'
  get '/requests/new' => 'requests#new', :as => 'new_request'
  post '/requests' => 'requests#create', :as => 'create_request'
  delete '/requests/:request_id' => 'requests#delete', :as => 'delete_request'

  #Translator Pages
  get 'claims' => 'claims#index', :as => 'index_claims'
  get 'claims/:claim_id' => 'claims#show', :as => 'show_claim'
  post 'claims' => 'claims#create', :as => 'create_claim'
  delete 'claims/:claim_id' => 'claims#delete', :as => 'delete_claim'
  patch 'claims/:claim_id' => 'claims#complete', :as => 'complete_claim'
  
  ## Translator -> View All Requests
  get '/translators/requests' => 'claims#requests', :as => 'view_requests'
  get '/translators/requests/:request_id' => 'claims#preview', :as => 'preview_request'

  
  root 'requests#index'

end
