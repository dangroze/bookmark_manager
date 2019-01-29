require 'bookmark'

RSpec.describe Bookmark do
  describe '.list' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end
