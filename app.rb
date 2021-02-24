require 'sinatra'

class DailyDiary < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Diary.all
    erb :'entries/index'
  end

  get '/entries/new' do
    erb :'entries/new'
  end

  post '/entries' do
    Diary.create(params[:entry])
    redirect '/entries'
  end

  run! if app_file == $PROGRAM_NAME
end
