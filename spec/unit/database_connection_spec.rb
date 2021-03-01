describe DatabaseConnection do
  describe '.setup' do
    it 'sends connect call to PG' do
      expect(PG).to receive(:connect).with(dbname: 'daily_diary_test')
      described_class.setup('daily_diary_test')
    end
  end

  describe '.query' do
    it 'runs a query through the connection from .setup' do
      connection = described_class.setup('daily_diary_test')
      expect(connection).to receive(:exec).with('SELECT * FROM entries;')
      described_class.query('SELECT * FROM entries;')
    end
  end
end
