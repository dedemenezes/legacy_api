module Scraper
  InformationBoxAsHash = proc do |path|
    doc_builder = DocBuilder.new path: path
    InformationsScraper.new(doc: doc_builder.html_doc).scrape_information_box
  end
end
