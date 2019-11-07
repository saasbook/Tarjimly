Rails.application.routes.draw do

  get    '/login'  => 'application#login',      :as => 'application_login'


  get   '/user/:uid/requests'          => 'user#requests',    :as => 'user_requests'
  get   '/user/:uid/requests/:rid'     => 'user#request',     :as => 'user_request'
  get   '/user/:uid/requests/new'      => 'user#new',         :as => 'new_request'
  post  '/user/:uid/requests/'         => 'user#create',      :as => 'create_request'
  delete'/user/:uid/requests/new'      => 'user#delete',      :as => 'delete_request'


  get   '/translator/:tid/claims'          => 'translator#claims',      :as => 'translator_claims'
  get   '/translator/:tid/claim/:cid'      => 'translator#claim',       :as => 'translator_claim'
  post  '/translator/:tid/claims'          => 'translator#new',         :as => 'new_claim'
  delete'/translator/:tid/claim/:cid'      => 'translator#delete',      :as => 'delete_claim'
  patch '/translator/:tid/claim/:cid'      => 'translator#complete',    :as => 'complete_claim'
  get    '/translator/requests'            => 'translator#requests',    :as => 'translator_requests'
  get    '/translator/requests/:rid'       => 'translator#request',     :as => 'preview_request'

  root 'application#login'

end
