namespace :scraper do
  desc "Seed books"
  task books: :environment do
    path = '/wiki/Harry_Potter_(book_series)'
    doc_builder = DocBuilder.new path: path
    list_scraper = ListScraper.new(doc: doc_builder.html_doc)
    books_hashes = list_scraper.ordered_list_i_link
    infos = []
    books_hashes.first(2).each do |hash|
      book = Book.new(hash)
      doc_builder.path = hash[:path]
      doc_builder.build_nokogiri_doc_from_url
      infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
      infos.each do |key, values|
        book.add_new_information(key, values)
        book
      end
    end
  end
end
