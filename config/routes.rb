Appetitush::Application.routes.draw do
  resources :sessions
  resources :comments
  resources :recipes
  resources :users

  match "/users/login", :to => 'users#login'
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
