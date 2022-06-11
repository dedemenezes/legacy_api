module Scraper
  InformationBoxAsHash = proc do |doc|
    InformationsScraper.new(doc: doc).scrape_information_box
  end
end
