feature 'Adding a new bookmark' do
  scenario 'User can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.newbookmark.com')
    fill_in('title', with: 'New Bookmark')
    click_button('Submit')

    expect(page).to have_link('New Bookmark', href: 'http://www.newbookmark.com')
  end
end
