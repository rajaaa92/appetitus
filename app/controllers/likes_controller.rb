class LikesController < RecipesController 
  def like_it
		@recipe = Recipe.find(params[:id])
		@recipe.rate = 3
		@recipe.save

		respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully liked.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
		end
  end
end
