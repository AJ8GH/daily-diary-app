require 'pg'

class Entry
  attr_reader :title, :body

  class << self
    def create(title:, body:)
      database_connection.exec(
        "INSERT INTO entries (body, title) VALUES ('#{body}', '#{title}');"
      )
    end

    def all
      rows = database_connection.exec("SELECT * FROM entries")
      rows.map do |row|
        new(
          id: row['id'],
          date: row['date'],
          title: row['title'],
          body: row['body']
        )
      end
    end
  end

  def initialize(title:, body:, id:, date:)
    @title = title
    @body  = body
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
