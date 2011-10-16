MyGithubLibrary::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  match "/dashboard" => "dashboard#index", :as => :dashboard
  
  root :to => "home#index"
  
end
