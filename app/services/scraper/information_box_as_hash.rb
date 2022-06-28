# frozen_string_literal: true

module Scraper
  # helper to access
  module InformationBoxAsHash
    def self.script
      proc do |doc|
        Parser::BoxInformation.new(doc: doc).scrape_information_box
      end
    end
  end
end
