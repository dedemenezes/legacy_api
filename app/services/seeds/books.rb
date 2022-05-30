module Seeds
  module Books
    def self.run
      puts 'seeding books'
      path = '/wiki/Harry_Potter_(book_series)'
      doc_builder = DocBuilder.new path: path
      list_scraper = ListScraper.new(doc: doc_builder.html_doc)
      books_hashes = list_scraper.ordered_list_i_link
      books_hashes.each do |hash|
        next unless AlreadyExist.instance?(Book, hash[:path])

        puts "Building book #{hash[:title]}"
        book = Book.new_book(hash)
        puts "#{book.title} ready!"
      end
    end
  end
end
