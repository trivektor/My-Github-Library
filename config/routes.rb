MyGithubLibrary::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  match "/dashboard" => "dashboard#index", :as => :dashboard
  
  resources :users
  
  resources :repositories do
    collection do
      get :sync
    end
  end
  
  root :to => "home#index"
  
end
