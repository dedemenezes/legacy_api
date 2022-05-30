module Seeds
  module Wikis
    def self.run
      Book.all.each do |book|
        puts "Scraping chars urls from #{book.title}"
        doc_builder = DocBuilder.new(path: book.character_index_url)

        chars = if doc_builder.doc_has_table?
                  TableScraper.new(doc: doc_builder.html_doc).all_urls_and_names
                else
                  ListScraper.new(doc: doc_builder.html_doc).unordered_list_from_parent_node
                end
        amount = chars.reject(&:nil?).map do |char|
          next unless AlreadyExist.instance?(Wiki, char[:path])
          next unless AlreadyExist.instance?(Wiki, char[:title])

          Wiki.create char
        end.compact.count
        puts "created #{amount} wikis for #{book.title}"
      end
    end
  end
end
