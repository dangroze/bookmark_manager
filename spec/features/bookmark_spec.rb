require 'pg'

feature 'Viewing bookmarks' do
  scenario 'can see a list of bookmarks' do
    # Add the test data
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy Software")
    Bookmark.create(url: "http://www.google.com", title: "google")

    visit('/')
    click_button('Bookmarks')

    expect(page).to have_content 'List of Bookmarks'
    expect(page).to have_link('google', href: 'http://www.google.com')
    expect(page).to have_link('Destroy Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
