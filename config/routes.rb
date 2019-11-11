Rails.application.routes.draw do

  get '/login' => 'appliscation#login', :as => 'application_login'
  get '/users/:uid/requests' => 'requests#index', :as => 'index_requests'
  get '/users/:uid/requests/:request_id' => 'requests#show', :as => 'show_request'
  get '/users/:uid/requests/new' => 'requests#new', :as => 'new_request'
  post '/users/:uid/requests' => 'requests#create', :as => 'create_request'
  delete '/users/:uid/requests/:request_id' => 'requests#delete', :as => 'delete_request'


<<<<<<< HEAD
  get   '/requests/:uid'             => 'requests#requests',    :as => 'user_requests'
  get   '/requests/:uid/pending'     => 'requests#pending',     :as => 'user_pending'
  get   '/requests/:uid/completed'   => 'requests#completed',   :as => 'user_completed'
  get   '/requests/:uid/:rid'        => 'requests#request',     :as => 'user_request'
  get   '/requests/:uid/:rid/edit'   => 'requests#edit',        :as => 'edit_request'
  get   '/requests/:uid/new'         => 'requests#new',         :as => 'new_request'
  post  '/requests/:uid'             => 'requests#create',      :as => 'create_request'
  delete'/requests/:uid/new'         => 'requests#delete',      :as => 'delete_request'


  get   '/claims/:tid'           => 'claims#claims',      :as => 'translator_claims'
  get   '/claims/:tid/:cid'      => 'claims#claim',       :as => 'translator_claim'
  post  '/claims/:tid'           => 'claims#new',         :as => 'new_claim'
  delete'/claims/:tid/:cid'      => 'claims#delete',      :as => 'delete_claim'
  patch '/claims/:tid/:cid'      => 'claims#complete',    :as => 'complete_claim'
  get    '/claims/requests'      => 'claims#requests',    :as => 'translator_requests'
  get    '/claims/requests/:rid' => 'claims#request',     :as => 'preview_request'

  root 'application#login'
=======
  get '/translators/requests' => 'claims#requests', :as => 'view_requests'
  get '/translators/requests/:request_id' => 'claims#preview', :as => 'preview_request'
  get '/translators/:tid/claims' => 'claims#index', :as => 'index_claims'
  get '/translators/:tid/claims/:claim_id' => 'claims#show', :as => 'show_claim'
  post '/translators/:tid/claims' => 'claims#create', :as => 'create_claim'
  delete '/translators/:tid/claims/:claim_id' => 'claims#delete', :as => 'delete_claim'
  patch '/translators/:tid/claims/:claim_id' => 'claims#complete', :as => 'complete_claim'
  
  root 'requests#index'
>>>>>>> 6408f6d962fbe9c9aef8b89677e146d7b67f4a74

end
