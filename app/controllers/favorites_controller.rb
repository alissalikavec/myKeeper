class FavoritesController < ApplicationController
	def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     favorite = current_user.favorites.build(bookmark: @bookmark)
 
     if favorite.save
       flash[:notice]= "Bookmark favorited!"
       redirect_to @bookmark
     else
       flash[:error] = "Unable add favorite, please try again."
       redirect_to @bookmark
     end
   end

   def destroy
   	@bookmark = Bookmark.find(params[:bookmark_id])
   	favorite = current_user.favorites.find(params[:id])

   	if favorite.destroy
   		flash[:notice] = "Removed favorite."
   		redirect_to @bookmark
   	else
   		flash[:error] = "Unable to remove favorite. Please try again."
   		redirect_to @bookmark
   	end
   end
end
