Appetitush::Application.routes.draw do
  resources :sessions

  match "/users/login", :to => 'users#login'
  resources :recipes, :has_many => :comments
  resources :users, :has_many => :recipes
  
  root :to => 'recipes#index' 
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'



end
