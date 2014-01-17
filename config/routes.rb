SocialSmarts::Application.routes.draw do

  namespace :api do #, :path => "", :constraints => {:subdomain => "api"}, :defaults => {:format => :json} do
    namespace :v1 do
      resources :mentions, only:[:index]
    end
  end

  root to: "dashboard#index"

  get 'home' => 'dashboard#index'

  get 'login' => 'sessions#index'

  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get
  post "/archive/:id" => "dashboard#archive"

end
