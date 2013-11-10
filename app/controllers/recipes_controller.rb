class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  expose(:recipes)
  expose(:recipe) { Recipe.where(id: params[:id]).first || (Recipe.new(params[:recipe]) if params["action"] == "new") }
  expose(:comments) { recipe.comments }
  expose(:comment) { recipe.comments.build }

  def index
  end

  def show
    redirect_to recipes_path, notice: "Recipe not found" if recipe.nil?
  end

  def new
  end

  def edit
		a = 0
    a = 1 if (current_user.id == recipe.user_id) || (current_user.role == "admin")
		if a == 0
			flash[:notice] = "Sorry, you can't edit this recipe"
			redirect_to(recipes_path)
		end
  end

  def create
		recipe.user_id = current_user.id
    if recipe.save
      redirect_to(recipe, :notice => 'Recipe was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if recipe.update_attributes(params[:recipe])
      redirect_to(recipe, :notice => 'Recipe was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    recipe.destroy
    redirect_to(recipes_url)
  end

	def like_it
		if Like.where(:recipe_id => recipe.id, :user_id => current_user.id) == []
			like = Like.new
			like.user_id = current_user.id
			like.recipe_id = recipe.id
			like.save
			recipe.increment!(:rate)
			recipe.save
	    redirect_to(recipe, :notice => 'You successfully liked the recipe.')
	  else
		  redirect_to(recipe, :notice => 'You have already liked this recipe.')
    end
  end

end
