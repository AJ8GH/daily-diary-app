require 'sinatra'

require_relative 'lib/entry'
require_relative 'lib/database_connection'

class DailyDiary < Sinatra::Base
  configure do
    enable :sessions, :method_override
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    erb :'entries/index'
  end

  get '/entries/:id/show' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/show'
  end

  get '/entries/new' do
    erb :'entries/new'
  end

  post '/entries' do
    Entry.create(title: params[:title], body: params[:body])
    redirect '/entries'
  end

  get '/entries/:id/edit' do
    @entry = Entry.find(id: params[:id])
    erb :'entries/edit'
  end

  patch '/entries/:id' do
    Entry.update(id: params[:id], title: params[:title], body: params[:body])
    redirect "/entries/#{params[:id]}/show"
  end
end
