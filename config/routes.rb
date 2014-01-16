SocialSmarts::Application.routes.draw do

  root to: "dashboard#index"
  get 'home' => 'dashboard#index'
  get 'archived_page' => 'dashboard#archived_page'
  get 'flagged_page' => 'dashboard#flagged_page'
  get 'replied_to' => 'dashboard#replied_to'
  post "/archive/:id" => "dashboard#archive"
  post "/retweet/:id" => "dashboard#retweet"
  post "/flag/:id" => "dashboard#flag"

  get 'login' => 'sessions#index'
  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get

end
