class CookbooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cookbooks = Cookbook.where(:user_id => current_user.id)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @cookbooks }
    end
  end

  
  def show
    @cookbook = Cookbook.find(params[:id])
		
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @cookbook }
    end
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

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to "/cookbooks", :notice => 'Cookbook was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      if @cookbook.update_attributes(params[:cookbook])
        format.html { redirect_to(@cookbook, :notice => 'Cookbook was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cookbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy

    respond_to do |format|
      format.html { redirect_to(cookbooks_url) }
      format.xml  { head :ok }
    end
  end
end
