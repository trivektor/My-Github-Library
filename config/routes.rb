MyGithubLibrary::Application.routes.draw do

  devise_for :users

  match "/dashboard" => "dashboard#index", :as => :dashboard
  
  root :to => "home#index"
  
end
