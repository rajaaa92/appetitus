class LikesController < RecipesController 
	def like_it
		@recipe = Recipe.find(params[:id])
		@recipe.rate = 3
		@recipe.save
		#@like = Like.new
		#@like.user_id = current_user.id
		#@like.recipe_id = @recipe.id
		
		#if Like.where(:recipe_id => @recipe.id, :user_id => current_user.id) == nil
			#respond_to do |format|
		   # if @like.save
					#t = @recipe.rate + 1
					
					#@recipe.update_attributes(rate = 3)
		    #  format.html { redirect_to(@recipe, :notice => 'You successfully liked the recipe.') }
		     # format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
		    #else
		     # format.html { redirect_to(@recipe, :notice => 
		      #'Recipe could not be liked.')}
		      
		   # end
    	#end
		#else
		#	format.html { redirect_to(@recipe, :notice => 
		 #     'Recipe could not be liked. You have already like it.')}
		#end

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
