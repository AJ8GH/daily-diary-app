def setup_test_database
  connection = PG.connect(dbname: 'daily_diary_test')
  connection.exec('TRUNCATE entries;')
  connection.close
end
