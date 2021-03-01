require 'pg'
require 'rake'

require_relative 'lib/database_connection'

namespace :db do
  task :connect do
    if ENV['ENVIRONMENT'] == 'test'
      puts '=== connected to test database ==='
      DatabaseConnection.setup('daily_diary_test')
    else
      DatabaseConnection.setup('daily_diary')
      puts '=== connected to development database ==='
    end
  end

  task :clean do
    connection = PG.connect(dbname: 'daily_diary_test')
    connection.exec('TRUNCATE entries RESTART IDENTITY;')
  end
end
