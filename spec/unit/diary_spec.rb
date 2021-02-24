describe Diary do
  describe '.create' do
    it 'adds an entry to the database' do
      described_class.create('Dear diary...')
      expect(described_class.all).to include 'Dear diary...'
    end
  end

  describe '.all' do
    it 'retrieves all the entries' do
      described_class.create('I saw a dog today')
      described_class.create('Mowed the lawn')
      described_class.create('Today was a good day')

      expect(described_class.all).to include 'I saw a dog today'
      expect(described_class.all).to include 'Mowed the lawn'
      expect(described_class.all).to include 'Today was a good day'
    end
  end
end
