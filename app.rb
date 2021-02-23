require 'sinatra'

class DailyDiary < Sinatra::Base
  get '/' do
    'Daily Diary'
  end

  run! if app_file == $PROGRAM_NAME
end
