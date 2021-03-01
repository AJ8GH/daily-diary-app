require 'pg'

class Entry
  attr_reader :title, :body, :id, :date

  class << self
    def create(title:, body:)
      row = DatabaseConnection.query(
        "INSERT INTO entries (body, title) VALUES ('#{body}', '#{title}')
        RETURNING id, date;"
      ).first
      new(id: row['id'], date: row['date'],
        title: row['title'], body: row['body'])
    end

    def all
      rows = DatabaseConnection.query("SELECT * FROM entries")
      rows.map do |row|
        new(id: row['id'], date: row['date'],
          title: row['title'], body: row['body'])
      end
    end
  end

  def initialize(title:, body:, id:, date:)
    @title = title
    @body  = body
    @date  = date
    @id    = id
  end
end
