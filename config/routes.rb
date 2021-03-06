require 'resque/server'

SocialSmarts::Application.routes.draw do

  mount Resque::Server.new, at: "/resque"

  namespace :api do #, :path => "", :constraints => {:subdomain => "api"}, :defaults => {:format => :json} do
    namespace :v1 do
      resources :mentions, only:[:index, :show]
      resources :klout, only:[:index]
      post 'update_klout' => 'klout#update_klout'
    end
  end

  root to: "dashboard#index"
  get 'home' => 'dashboard#index'
  get 'archived_page' => 'dashboard#archived_page'
  get 'flagged_page' => 'dashboard#flagged_page'
  get 'replied_to' => 'dashboard#replied_to'
  get 'latest_mentions' => 'dashboard#latest_mentions'
  post "/archive/:id" => "dashboard#archive"
  post "/retweet/:id" => "dashboard#retweet", as: 'retweet'
  post "/flag/:id" => "dashboard#flag"
  post "/reply/:id" => "dashboard#reply"

  # Sessions
  get 'login' => 'sessions#index'
  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get

end
