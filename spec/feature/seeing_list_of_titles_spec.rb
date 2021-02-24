feature 'seeing a list of titles of all entries' do
  scenario 'adds 3 entries, visits page and sees all three titles' do
    Entry.create(title: 'Title one', body: 'Body one')
    Entry.create(title: 'Title two', body: 'Body two')
    Entry.create(title: 'Title three', body: 'Body three')

    visit '/entries'

    expect(page).to have_content 'Title one'
    expect(page).to have_content 'Title three'
    expect(page).to have_content 'Title two'
  end
end
