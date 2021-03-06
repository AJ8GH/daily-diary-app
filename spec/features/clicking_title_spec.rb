feature 'click entry title to read full entry' do
  scenario 'sees titles with links to entries' do
    entry = Entry.create(title: 'Title one', body: 'Body one')
    visit '/entries'
    expect(page).to have_button 'Title one'
  end

  scenario 'clicks title and sees the related entry' do
    entry = Entry.create(title: 'Title one', body: 'Body one')
    visit '/entries'
    click_button 'Title one'
    expect(page).to have_content 'Body one'
  end
end
