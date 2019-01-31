require 'bookmark'
require 'setup_test_database'

RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add test data
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Destroy Software', 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('google', 'http://www.google.com');")
      bookmarks = Bookmark.all

      expect(bookmarks.first.title).to eq('Makers')
      expect(bookmarks[1].title).to eq('Destroy Software')
      expect(bookmarks[2].url).to eq('http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.newbookmark.com', title: 'New Bookmark').first

      expect(bookmark['url']).to eq 'http://www.newbookmark.com'
      expect(bookmark['title']).to eq 'New Bookmark'
    end
  end
end
