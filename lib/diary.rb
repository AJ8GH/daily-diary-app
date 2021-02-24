class Diary
  class << self
    def create(entry)
      database_connection.exec("INSERT INTO entries (entry) VALUES ('#{entry}');")
    end

    def all
      rows = database_connection.exec("SELECT * FROM entries")
      rows.map { |row| row['entry'] }
    end
  end

  private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'daily_diary_test')
    else
      PG.connect(dbname: 'daily_diary')
    end
  end
end
