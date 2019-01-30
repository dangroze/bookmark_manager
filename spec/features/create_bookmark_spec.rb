feature 'Adding a new bookmark' do
  scenario 'User can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.newbookmark.com')
    click_button('Submit')

    expect(page).to have_content('http://www.newbookmark.com')
  end
end
