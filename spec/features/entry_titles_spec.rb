feature 'giving each entry a title' do
  scenario 'adds title and entry and sees title' do
    visit '/entries'
    click_button 'Add Entry'
    fill_in :title, with: 'Test title'
    fill_in :body, with: 'Test entry'
    click_button 'Submit'
    expect(page).to have_button 'Test title'
  end
end
