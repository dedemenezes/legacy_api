# frozen_string_literal: true

module Seeds
  module Wikis
    def self.run(filter = nil)
      puts 'Scraping chars urls'
      books = Book.all
      books = books.first(filter) if filter
      books.each do |book|
        doc_builder = Scraper::DocBuilder.new(path: book.character_index_url)

        chars       = if doc_builder.doc_has_table?
                        Scraper::TableScraper.new(doc: doc_builder.html_doc).all_urls_and_names
                      else
                        Scraper::ListScraper.new(doc: doc_builder.html_doc).unordered_list_from_parent_node
                      end
        amount      = chars.compact.map do |char|
          next unless AlreadyExist.instance?(Wiki, char[:path]) || AlreadyExist.instance?(Wiki, char[:title])

          Wiki.create char
        end.compact.count
        puts "created #{amount} wikis for #{book.title}"
      end
      puts "Done zo/\n"
    end
  end
end
