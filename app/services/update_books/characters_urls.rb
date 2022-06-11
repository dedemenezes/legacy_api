module UpdateBooks
  CharactersUrls = proc do |book, doc|
    character_index_url = CharacterIndexUrlScraper.new(doc: doc).scrape
    book.character_index_url = character_index_url
    book
  end
end
