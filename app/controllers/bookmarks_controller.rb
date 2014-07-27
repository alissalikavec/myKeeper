class BookmarksController < ApplicationController
  def index
  	if params[:tag]
  		@bookmarks = Bookmark.tagged_with(params[:tag])
  	else
  		@bookmarks = Bookmark.all	
  	end
  	
  end

  def new
  end

  def show
  	@bookmark = Bookmark.find(params[:id])
  end

  def create
  	@bookmark = Bookmark.new(bookmark_params)

  	@bookmark.save
  	redirect_to @bookmark
  end

  private
  def bookmark_params
  	params.require(:bookmark).permit(:title, :text, :tag_list)
  end
end
