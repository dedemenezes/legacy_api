module Scraper
  module InformationBoxAsHash
    def self.script
      proc do |doc|
        InformationsScraper.new(doc: doc).scrape_information_box
      end
    end
  end
end


# script.call(doc)
