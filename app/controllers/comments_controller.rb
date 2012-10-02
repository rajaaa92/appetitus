class CommentsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @comments }
    end
  end


  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @comment }
    end
  end

  
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @comment }
    end
  end

  
  def edit
		@recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
  end


  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(params[:comment])
		@comment.user_id = current_user.id
		respond_to do |format|
      if @comment.save
        format.html { redirect_to(@recipe, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { redirect_to(@recipe, :notice => 
        'Comment could not be saved. Please fill in all fields')}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
