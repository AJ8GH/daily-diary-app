describe Entry do
  describe '.create' do
    it 'adds an entry to the database' do
      described_class.create(title: 'Test Entry', body: 'Test body')
      expect(described_class.all.first.title).to eq 'Test Entry'
    end
  end

  describe '.all' do
    it 'retrieves all the entries' do
      described_class.create(title: 'Saw dog', body: 'I saw a dog today')
      described_class.create(title: 'Tuesday', body: 'Mowed lawn today')
      described_class.create(title: 'Good day', body: 'Today was a good day')

      expect(described_class.all.map(&:title)).to include 'Saw dog'
      expect(described_class.all.map(&:title)).to include 'Tuesday'
      expect(described_class.all.map(&:title)).to include 'Good day'
    end
  end

  describe '.find' do
    it 'finds entry by id' do
      entry = described_class.create(title: 'Saw dog', body: 'I saw a dog today')
      found_entry = described_class.find(id: entry.id)

      expect(entry.id).to eq found_entry.id
      expect(entry.title).to eq found_entry.title
      expect(entry.body).to eq found_entry.body
    end
  end

  describe '#title' do
    it 'returns the title' do
      entry = described_class.new(title: 'Test title', body: 'Test entry', id: 1, date: '2021-02-24')
      expect(entry.title).to eq 'Test title'
    end
  end

  describe '#body' do
    it 'returns the body' do
      entry = described_class.new(title: 'Test title', body: 'Test entry', id: 1, date: '2021-02-24')
      expect(entry.body).to eq 'Test entry'
    end
  end
end
