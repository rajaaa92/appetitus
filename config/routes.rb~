Appetitush::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

	resources :users
  resources :recipes do
  	resources :comments
	end
	resources :cookbooks
	resources :likes
    
	get "new_recipe" => "recipes#new", :as => "new_recipe"
	post "new_like" => "recipes#like_it", :as => "new_like"
	get "new_like" => "recipes#like_it", :as => "new_like"
	get "add_to_cb" => "recipes#add_to_cb", :as => "add_to_cb"
	
  root :to => 'recipes#index' 

end
