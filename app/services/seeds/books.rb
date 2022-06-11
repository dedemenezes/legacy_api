# frozen_string_literal: true

module Seeds
  module Books
    def self.run(filter = nil)
      puts 'seeding books'
      path          = '/wiki/Harry_Potter_(book_series)'
      books_as_hash = Scraper::BooksListAsHash.call(path)
      books_as_hash = books_as_hash.first(filter) if filter
      books_as_hash.each do |hash|
        # next unless AlreadyExist.instance?(Book, hash[:path])

        puts "Building book #{hash[:title]}"
        book = GenerateBookAndRelatedInstances.call(hash)
        puts "#{book.title} ready!"
      end
    end
  end
end
