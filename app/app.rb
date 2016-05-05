ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'


class W4BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    tag = Tag.create(tag_name: params[:tag])
    link = Link.create(title: params[:title], url: params[:url])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
