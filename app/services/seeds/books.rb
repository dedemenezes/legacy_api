# frozen_string_literal: true

module Seeds
  module Books
    def self.run
      puts 'seeding books'
      path          = '/wiki/Harry_Potter_(book_series)'
      doc_builder   = DocBuilder.new path: path
      list_scraper  = ListScraper.new(doc: doc_builder.html_doc)
      books_as_hash = list_scraper.ordered_list_i_link
      books_as_hash.each do |hash|
        # next unless AlreadyExist.instance?(Book, hash[:path])

        puts "Building book #{hash[:title]}"
        new_book(hash)

        puts "#{@new_book.title} ready!"
      end
    end

    def self.new_book(hash)
      doc_builder = DocBuilder.new path: hash[:path]
      # doc_builder.build_nokogiri_doc_from_url
      character_index_url = CharacterIndexUrlScraper.new(doc: doc_builder.html_doc).scrape
      infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box

      @new_book = Book.find_by(name: hash[:title]) || Book.create(hash)

      @new_book.character_index_url = character_index_url

      %i[cover_artist interior narrator author].each do |type|
        UpdateBooks::AssignArtists.call(infos, type, @new_book)
      end

      UpdateBooks::MissingFields.call(infos, @new_book)
      # @new_book.update_what_is_missing(infos)
    end

    def self.assign_artist(artist, type)
      artist = Artist.find_by_name_or_path(artist) || Artist.create!(name: artist[:title], path: artist[:path])
      BookArtist.create artist: artist, book: @new_book, role: type
    end

    def self.assign_artists(hash, type)
      hash[type.to_s.gsub('_', ' ')].each do |artist|
        assign_artist(artist, type)
      end
    end
  end
end
