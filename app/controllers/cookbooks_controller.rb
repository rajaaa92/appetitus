class CookbooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cookbooks = Cookbook.where(:user_id => current_user.id)
  end

  def show
    @cookbook = Cookbook.find(params[:id])
  end

  def new
    @cookbook = Cookbook.new
		@recipe = Recipe.find_by_id(params[:recipe_id])
		@cookbook.recipe_id = @recipe.id
		@cookbook.user_id = current_user.id
		@cookbook.save
		redirect_to "/cookbooks", :notice => 'Recipe was successfully added to your cookbook.'
  end

  def edit
    @cookbook = Cookbook.find(params[:id])
  end

  def create
    @cookbook = Cookbook.new(params[:cookbook])
		@cookbook.user_id = current_user.id
    redirect_to "/cookbooks", :notice => 'Cookbook was successfully created.' if @cookbook.save
  end

  def update
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      if @cookbook.update_attributes(params[:cookbook])
        format.html { redirect_to(@cookbook, :notice => 'Cookbook was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy
    redirect_to(cookbooks_url)
  end
end
