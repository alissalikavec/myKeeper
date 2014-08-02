class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by(email: params[:sender])
    @bookmark = Bookmark.new
    @bookmark.title = params[:'stripped-text']
    @bookmark.tag_list = params[:subject]
    @bookmark.user = @user
    @bookmark.save
    head 200
  end
end