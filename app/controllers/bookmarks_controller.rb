class BookmarksController < ApplicationController
  def index
  	if params[:tag]
  		@bookmarks = Bookmark.tagged_with(params[:tag])
      authorize @bookmarks
  	else
  		@bookmarks = Bookmark.all
      authorize @bookmarks
  	end
  	
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
    else
      flash[:error] = "There was an error saving your bookmark! Please try again."
      render :edit
    end
  end

  def show
  	@bookmark = Bookmark.find(params[:id])
  end

  def create
  	@bookmark = Bookmark.new(bookmark_params)
    authorize @bookmark
    @bookmark = current_user.bookmarks.build(bookmark_params)

  	if @bookmark.save
      flash[:notice] = "Bookmark saved!"
  	  redirect_to @bookmark
    else
      flash[:error] = "Oops, there was a problem saving your bookmark. Try again!"
      render :new
    end
  end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      authorize @bookmark
      if @bookmark.destroy
        flash[:notice] = "Bookmark destroyed."
        redirect_to bookmarks_path
      else
        flash[:error] = "Bookmark could not be destroyed. Please try again."
        render :show
    end
  end

  private
  def bookmark_params
  	params.require(:bookmark).permit(:title, :text, :tag_list)
  end
end
