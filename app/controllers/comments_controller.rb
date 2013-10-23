class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  expose(:comment) { Comment.where(id: params[:id]).first || Comment.new(recipe_id: recipe.id) }
  expose(:recipe) { Recipe.where(id: params[:recipe_id]).first }

  def edit
  end

  def create
    comment.update_attributes(params[:comment])
		comment.user_id = current_user.id
    if comment.save
      redirect_to(recipe, :notice => 'Comment was successfully created.')
    else
      redirect_to(recipe, :notice => 'Comment could not be saved. Please fill in all fields')
    end
  end

  def update
    if comment.update_attributes(params[:comment])
      redirect_to(recipe, :notice => 'Comment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    comment.destroy
    redirect_to(recipe)
  end
end
