require 'rake'

namespace :db do
  task :connect do
    if ENV['ENVIRONMENT'] = 'test'
      puts '=== connected to test database ==='
      DatabaseConnection.setup('daily_diary_test')
    else
      DatabaseConnection.setup('daily_diary')
      puts '=== connected to development database ==='
    end
  end

  task :clean do
    PG.connect(dbname: 'daily_diary_test').query('TRUNCATE entries;')
  end
end
