feature 'editing entries' do
  scenario 'see new content after editing' do
    Entry.create(title: 'Test', body: 'This is a test')

    visit '/entries'
    click_button 'Test'
    click_button 'Edit'
    fill_in :body, with: 'This is not a test'
    click_button 'Save'

    expect(page).to have_content 'This is not a test'
    expect(page).not_to have_content 'This is a test'
  end
end
