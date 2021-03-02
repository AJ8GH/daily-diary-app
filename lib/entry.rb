class Entry
  attr_reader :title, :body, :id, :date

  class << self
    def create(title:, body:)
      row = DatabaseConnection.query("INSERT INTO entries (body, title)
      VALUES ('#{body}', '#{title}') RETURNING *;").first

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

    def find(id:)
      row = DatabaseConnection.query("SELECT * FROM entries
        WHERE id = #{id};").first

      new(id: row['id'], date: row['date'],
        title: row['title'], body: row['body'])
    end

    def update(id:, title:, body:)
      DatabaseConnection.query("UPDATE entries
        SET title = '#{title}', body = '#{body}' WHERE id = #{id};")
    end
  end

  def initialize(title:, body:, id:, date:)
    @title = title
    @body  = body
    @date  = date
    @id    = id
  end
end
