require 'sinatra'
require './lib/entry'

class DailyDiary < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    erb :'entries/index'
  end

  get '/entries/new' do
    erb :'entries/new'
  end

  post '/entries' do
    Entry.create(title: params[:title], body: params[:body])
    redirect '/entries'
  end

  run! if app_file == $PROGRAM_NAME
end
