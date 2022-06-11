# frozen_string_literal: true

module Seeds
  module Books
    def self.run
      puts 'seeding books'
      path          = '/wiki/Harry_Potter_(book_series)'
      books_as_hash = Scraper::BooksListAsHash.call(path)

      books_as_hash.each do |hash|
        # next unless AlreadyExist.instance?(Book, hash[:path])

        puts "Building book #{hash[:title]}"
        new_book(hash)

        puts "#{@new_book.title} ready!"
      end
    end

    def self.new_book(hash)
      # doc_builder.build_nokogiri_doc_from_url
      # doc_builder = DocBuilder.new path: hash[:path]
      # infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
      infos = Scraper::InformationBoxAsHash.call(hash[:path])
      character_index_url = CharacterIndexUrlScraper.new(doc: doc_builder.html_doc).scrape
      @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)

      @new_book.character_index_url = character_index_url

      %i[cover_artist interior narrator author].each do |type|
        UpdateBooks::AssignArtists.call(infos, type, @new_book)
      end

      UpdateBooks::MissingFields.call(infos, @new_book)
      # @new_book.update_what_is_missing(infos)
    end
  end
end
