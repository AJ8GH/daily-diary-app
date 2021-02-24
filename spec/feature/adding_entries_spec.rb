feature 'adding entries' do
  scenario 'user adds entry and sees it in entries' do
    visit '/entries'
    click_button 'Add Entry'
    fill_in :title, with: 'Test Title'
    fill_in :body, with: 'Dear diary...'
    click_button 'Submit'
    expect(page).to have_content('Test Title')
  end

  scenario 'user adds 2 entries and sees both' do
    visit '/entries'
    click_button 'Add Entry'
    fill_in :title, with: 'Test Title'
    fill_in :body, with: 'Dear diary...'
    click_button 'Submit'

    click_button 'Add Entry'
    fill_in :title, with: 'Saw Dog'
    fill_in :body, with: 'Saw a dog today'
    click_button 'Submit'
    expect(page).to have_content('Test Title')
    expect(page).to have_content('Saw Dog')
  end
end
