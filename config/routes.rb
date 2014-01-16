SocialSmarts::Application.routes.draw do

  root to: "dashboard#index"

  get 'home' => 'dashboard#index'

  get 'login' => 'sessions#index'

  get 'archive_page' => 'dashboard#archive_page'

  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get
  post "/archive/:id" => "dashboard#archive"
  post "/retweet/:id" => "dashboard#retweet"
  post "/flag/:id" => "dashboard#flag"

end
