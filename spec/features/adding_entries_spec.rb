feature 'adding entries' do
  scenario 'seeing entry after adding it' do
    visit '/entries'
    click_button 'Add Entry'
    fill_in :title, with: 'Test Title'
    fill_in :body, with: 'Dear diary...'
    click_button 'Submit'
    expect(page).to have_button('Test Title')
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
    expect(page).to have_button('Test Title')
    expect(page).to have_button('Saw Dog')
  end
end
