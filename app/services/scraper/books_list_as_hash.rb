module Scraper
  BooksListAsHash = proc do |path|
    doc_builder   = DocBuilder.new path: path
    list_scraper  = ListScraper.new(doc: doc_builder.html_doc)
    list_scraper.ordered_list_i_link
  end
end
