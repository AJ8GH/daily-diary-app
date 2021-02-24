# Daily Diary App

## Dependencies

Ruby Version:
- `2.7.2`

Gems:
- `capybara`
- `coveralls`
- `puma`
- `rack`
- `rspec`
- `rubocop`
- `sinatra`

## Database setup

- Enter psql and create db called daily_diary

```sql
CREATE DATABASE daily_diary;
```

- Create a table called entries with 3 columns: id (serial primary key), entry (varchar (500) ), date ( default current_date)

```sql
CREATE TABLE entries (
  id SERIAL PRIMARY KEY,
  entry varchar ( 500 ) NOT NULL,
  date DATE NOT NULL DEFAULT CURRENT_DATE
);
```

- Test database - create a database called daily_diary_test with an identical table

- Add title column to both databases
```sql
ALTER TABLE entries
ADD COLUMN title varchar ( 60 );
```

## Running tests

Run tests with rspec

- Simply run `rspec` in the root folder to run all tests
- Run `rspec -fd` for format documentation

## Getting Started

## Approach and design


