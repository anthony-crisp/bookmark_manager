ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require_relative './models/link.rb'

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
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end


  run! if app_file == $0
end
