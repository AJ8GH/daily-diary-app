feature 'adding entries' do
  scenario 'user adds entry and sees it in entries' do
    visit '/entries'
    click_button 'Add Entry'
    fill_in :entry, with: 'Dear diary...'
    click_button 'Submit'
    expect(page).to have_content('Dear diary')
  end
end
