namespace :scraper do
  desc "Seed books"
  task books: :environment do
    path = '/wiki/Harry_Potter_(book_series)'
    doc_builder = DocBuilder.new path: path
    list_scraper = ListScraper.new(doc: doc_builder.html_doc)
    books_hasheslist_scraper.ordered_list_i_link
    infos = []
    books_hashes.first(2).each do |hash|
      Book.new()
      doc_builder.path = hash[:path]
      doc_builder.build_nokogiri_doc_from_url
      binding.pry
      infos = InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
    end
    infos.each do |info_hash|

    end
  end
end
