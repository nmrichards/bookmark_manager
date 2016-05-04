require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    Link.create(url: params[:URL], title: params[:Title])
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
