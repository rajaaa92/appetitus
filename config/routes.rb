Appetitush::Application.routes.draw do
  devise_for :users

	get "new_recipe" => "recipes#new", :as => "new_recipe"
	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"
  
	resources :recipes
  resources :users
	resources :sessions

  #match "/users/login", :to => 'users#login'
  
	resources :recipes do
    resources :comments
  end
  resources :users do
    resources :recipes
  end
  
  root :to => 'recipes#index' 
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'



end
