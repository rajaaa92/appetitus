Appetitush::Application.routes.draw do
  devise_for :users

	resources :users
  resources :recipes do
  	resources :comments
	end
	resources :cookbooks
    
	get "new_recipe" => "recipes#new", :as => "new_recipe"
	
  root :to => 'recipes#index' 

end
