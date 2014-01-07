SocialSmarts::Application.routes.draw do
  root to: "sessions#index"
  match "/auth/:provider/callback" => "sessions#create", via: :get
  match "/signout" => "sessions#destroy", :as => :signout, via: :get
end
