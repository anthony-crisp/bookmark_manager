ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require_relative './models/tag.rb'
require_relative './models/link.rb'
require_relative './data_mapper_setup'



class BookmarkManager < Sinatra::Base

  get '/' do
    #erb :index
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/links_new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = params[:tags].split(", ")
    p
    tag.each do |x|
      x = Tag.create(name: x)
    link.tags << x
  end
    link.save
    redirect '/links'
  end

   get '/tags/:name' do
     tag = Tag.first(name: params[:name])
     @links = tag ? tag.links : []
     erb :'links/index'
   end

  run! if app_file == $0
end
