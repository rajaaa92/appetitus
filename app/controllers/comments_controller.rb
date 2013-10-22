class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
		@recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(params[:comment])
		@comment.user_id = current_user.id
    if @comment.save
      redirect_to(@recipe, :notice => 'Comment was successfully created.')
    else
      redirect_to(@recipe, :notice => 'Comment could not be saved. Please fill in all fields')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to(@comment, :notice => 'Comment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_url)
  end
end
