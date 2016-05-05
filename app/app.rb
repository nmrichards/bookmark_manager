ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  get '/links/shopping' do
    @linked_tags = Link.all(:link_tags => {:tag_id => 2})
    erb :'links/shopping'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
  	redirect '/links'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
