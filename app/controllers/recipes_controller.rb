class RecipesController < ApplicationController 
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
		a = 0
    a = 1 if (current_user.id == @recipe.user_id) ||
		         (current_user.role == "admin")
		if a == 0
			flash[:notice] = "Sorry, you can't edit this recipe"
			redirect_to(recipes_path)
		end
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
		@recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end

	def like_it
		@recipe = Recipe.find(params[:id])

		if Like.where(:recipe_id => @recipe.id, :user_id => current_user.id) == []
			@like = Like.new
			@like.user_id = current_user.id
			@like.recipe_id = @recipe.id
			@like.save
			@recipe.increment!(:rate)
			@recipe.save
		
			respond_to do |format|
		   	format.html { redirect_to(@recipe, :notice => 'You successfully liked the recipe.') }
		    format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
			end
		else
			respond_to do |format|
			  format.html { redirect_to(@recipe, :notice => 'You have already liked this recipe.')}
		  end
    end
  end

end
