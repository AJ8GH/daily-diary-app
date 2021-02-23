require 'sinatra'

class DailyDiary < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/entries' do
    erb :'entries/index'
  end

  get '/entries/new' do
    erb :'entries/new'
  end

  post '/entries' do
    redirect '/entries'
  end

  run! if app_file == $PROGRAM_NAME
end
