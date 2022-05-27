namespace :scraper do
  desc "Scrape books main url"
  task book_hashes: :environment do
    path = '/wiki/Harry_Potter_(book_series)'
    doc_builder = DocBuilder.new path: path
    book_hashes = ListScraper.new(doc: doc_builder.html_doc).ordered_list_i_link
    book_hashes
  end
end
