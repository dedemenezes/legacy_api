# frozen_string_literal: true

module UpdateModel
  module CharactersIndexUrl
    def self.script
      proc do |book, doc|
        character_index_url = Scraper::CharacterIndexUrlScraper.new(doc: doc).scrape
        book.character_index_url = character_index_url
        book
      end
    end
  end
end
# script.call(args)
