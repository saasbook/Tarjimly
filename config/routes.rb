Rails.application.routes.draw do

  get    '/login'  => 'application#login',      :as => 'application_login'


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

end
