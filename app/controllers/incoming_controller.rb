class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    Bookmark.create!({title: params[:'stripped-text'], tag_list: params[:subject]})
    head 200

    #TODO: tie user email to user
  end
end