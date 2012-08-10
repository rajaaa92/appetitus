Appetitush::Application.routes.draw do
  resources :sessions

  match "/users/login", :to => 'users#login'
  resources :recipes
  resources :users
  
  root :to => 'recipes#index' 
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'



end
