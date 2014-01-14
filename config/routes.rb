SocialSmarts::Application.routes.draw do

  root to: "dashboard#index"

  get 'home' => 'dashboard#index'

  get 'login' => 'sessions#index'

  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/archive" => "dashboard#archive", via: :post
  match "/signout" => "sessions#destroy", :as => :signout, via: :get

end
